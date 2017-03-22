function  corr_offset_xcorr = correct_chromatic_aberration(ch1_tif_file,ch2_tif_file)

% This function takes two images in two different channels. Then, for each Z layer, 
% it estimates the 2D shift (chromatic aberration). We use the function normxcorr2_general 
% (Dirk Padfield. "Masked FFT registration". In Proc. Computer Vision and Pattern 
% Recognition, 2010).

% Loading the two images.
I_ch1 = Read_3D_image_files(ch1_tif_file);
I_ch2 = Read_3D_image_files(ch2_tif_file);

N_Z_layers = size(I_ch1,3);

corr_offset_xcorr = zeros(N_Z_layers,2);
% Estimating the 2D shift for each Z layer.
for Z = 1:N_Z_layers
    corr_offset_xcorr(Z,:) = estimate_shift_between_2D_data_sets(I_ch1(:,:,Z),I_ch2(:,:,Z)); % The shift maybe different for different Z layers.
end

