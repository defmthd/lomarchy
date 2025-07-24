for s in ./install/*.sh; do
  echo -e "\nInstalling: $s"
  source "$s"
done
