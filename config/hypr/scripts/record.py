import os
import signal
import subprocess
import sys
import tempfile
import wave

import numpy as np
import sounddevice as sd
from faster_whisper import WhisperModel

LOCK_FILE = "/tmp/voice_recording.lock"
SAMPLE_RATE = 16000
MODEL_SIZE = "medium"

if os.path.exists(LOCK_FILE):
    # Stop mode: send SIGUSR1 to running PID
    with open(LOCK_FILE, "r") as f:
        pid = int(f.read())
    os.kill(pid, signal.SIGUSR1)
    sys.exit(0)

# Start mode
pid = os.getpid()
with open(LOCK_FILE, "w") as f:
    f.write(str(pid))

audio_buffer = []

def stop_recording(signum, frame):
    """Signal handler to stop recording and do transcription."""
    stream.stop()
    stream.close()
    
    # Save audio
    with tempfile.NamedTemporaryFile(suffix=".wav", delete=False) as tmp_file:
        tmp_path = tmp_file.name
        with wave.open(tmp_path, "wb") as wf:
            wf.setnchannels(1)
            wf.setsampwidth(2)
            wf.setframerate(SAMPLE_RATE)
            int_data = (np.concatenate(audio_buffer) * 32767).astype(np.int16)
            wf.writeframes(int_data.tobytes())
    
    # Transcribe
    model = WhisperModel(MODEL_SIZE, device="cpu", compute_type="int8")
    segments, _ = model.transcribe(
        tmp_path, 
        beam_size=1, 
        best_of=1, 
        no_speech_threshold=0.3
    )
    os.remove(tmp_path)
    text = " ".join(seg.text.strip() for seg in segments if seg.text.strip())
    
    # Copy to clipboard
    subprocess.run(["wl-copy"], input=text.encode())
    os.remove(LOCK_FILE)
    subprocess.run([
        "notify-send", 
        "✅ Transcription done and copied to clipboard!"
    ])
    sys.exit(0)

signal.signal(signal.SIGUSR1, stop_recording)

def audio_callback(indata, frames, time, status):
    """Callback function for audio input stream."""
    audio_buffer.append(indata.copy())


# Start recording
stream = sd.InputStream(
    samplerate=SAMPLE_RATE, 
    channels=1, 
    callback=audio_callback
)
stream.start()
subprocess.run([
    "notify-send", 
    "🎤 Recording...", 
    "Press the keybinding again to stop."
])

# Wait indefinitely until signal is received
signal.pause()

