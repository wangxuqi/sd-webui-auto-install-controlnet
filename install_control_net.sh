#!/bin/bash

# Check if current directory is "stable-diffusion-webui"
if [ "${PWD##*/}" != "stable-diffusion-webui" ]; then
    echo "Error: Please run this script from the 'stable-diffusion-webui' directory."
    exit 1
fi

# Download all required files
declare -a urls=(
  "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
  "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
  "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
  "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
  "https://huggingface.co/webui/ControlNet-modules-safetensors/blob/main/control_normal-fp16.safetensors"
  "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
  "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
  "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
  "https://huggingface.co/lllyasviel/ControlNet/resolve/main/annotator/ckpts/body_pose_model.pth"
  "https://huggingface.co/lllyasviel/ControlNet/resolve/main/annotator/ckpts/hand_pose_model.pth"
  "https://huggingface.co/lllyasviel/ControlNet/blob/main/annotator/ckpts/dpt_hybrid-midas-501f0c75.pt"
  "https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_openpose.pth"
)

for url in "${urls[@]}"
do
    filename=$(basename $url)
    if [ ! -f "$filename" ]; then
        echo "Downloading $filename"
        wget "$url"
    else
        echo "$filename already exists"
    fi
done

# Move the downloaded files to the correct directories
mkdir -p extensions/sd-webui-controlnet/models
mkdir -p extensions/sd-webui-controlnet/annotator/openpose

mv control_canny-fp16.safetensors extensions/sd-webui-controlnet/models
mv control_depth-fp16.safetensors extensions/sd-webui-controlnet/models
mv control_hed-fp16.safetensors extensions/sd-webui-controlnet/models
mv control_mlsd-fp16.safetensors extensions/sd-webui-controlnet/models
mv control_normal-fp16.safetensors extensions/sd-webui-controlnet/models
mv control_openpose-fp16.safetensors extensions/sd-webui-controlnet/models
mv control_scribble-fp16.safetensors extensions/sd-webui-controlnet/models
mv control_seg-fp16.safetensors extensions/sd-webui-controlnet/models
mv body_pose_model.pth extensions/sd-webui-controlnet/annotator/open
