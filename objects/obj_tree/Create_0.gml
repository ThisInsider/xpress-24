visible = false;

// Assign the sprite sheet (single sprite with multiple frames)
sprite_index = spr_tree; // Replace with your actual sprite sheet name

// Define the number of frames in the sprite sheet
var frame_count = 6; // Adjust this number if your sprite sheet has a different number of frames

// Randomly select a frame index
var selected_frame = irandom(frame_count - 1);

// Assign the selected frame to the object
image_index = selected_frame;

// Stop the animation to display a static image
image_speed = 0;

// Define the scale range (e.g., between 0.5x and 1.5x the original size)
var min_scale = 1.0;
var max_scale = 1.2;

// Randomly generate scale factors
var scale_x = random_range(min_scale, max_scale);

// Apply the scale factors to the sprite
image_xscale = scale_x;
image_yscale = scale_x;