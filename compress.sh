#!/bin/bash
find static/images -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r file; do
  base="${file%.*}"
  dir=$(dirname "$file")
  name=$(basename "$base")

  echo "Processing: $file"

  # Full-size AVIF
  sharp -i "$file" -o "$dir/${name}.avif" --format avif

  # Resized versions
  sharp -i "$file" -o "$dir/${name}-320.avif" resize 320 --format avif
  sharp -i "$file" -o "$dir/${name}-640.avif" resize 640 --format avif
  sharp -i "$file" -o "$dir/${name}-1280.avif" resize 1280 --format avif
done
