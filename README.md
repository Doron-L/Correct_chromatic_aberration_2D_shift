# Correct_chromatic_aberration_2D_shift

This function takes two images in two different channels. Then, for each Z layer, 
it estimates the 2D shift (chromatic aberration). We use the function normxcorr2_general 
(Dirk Padfield. "Masked FFT registration". In Proc. Computer Vision and Pattern 
Recognition, 2010).

Example:
corr_offset_xcorr = correct_chromatic_aberration(ch1_tif_file,ch2_tif_file)
