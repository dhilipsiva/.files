# Scripts to run after platform specific things are loaded
if [ -x "$(command -v kubectl)" ]; then
  echo "Found "
  source <(kubectl completion bash)
fi
