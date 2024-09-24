#!/usr/bin/env fish

# Assign arguments to variables
set src_dir "/home/dhilipsiva/.files/.config"
set dst_dir "/home/dhilipsiva/.config"

# Loop through each file in the source directory
for dir in $src_dir/*
    set dirname (basename $dir)
    set target $dst_dir/$dirname
    # rm -rf $target
    ln -s $dir $dst_dir
    echo "Symlink created: $dir -> $target"
end

echo "All files have been symlinked from '$src_dir' to '$dst_dir'."
