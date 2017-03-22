function corr_offset = estimate_shift_between_2D_data_sets(Template,offsetTemplate)

% This function estimates by how much offsetTemplate is offsetted from Template.
% Both Template offsetTemplate have to be 2D matrixes. The offset is corr_offset, 
% where corr_offset(1) and corr_offset(2) is for the X and Y axes, respectively.

% We use the function normxcorr2_general (Dirk Padfield. "Masked FFT registration". 
% In Proc. Computer Vision and Pattern Recognition, 2010). The function is limited 
% to find shifts till size(Template)-1e3. For larger shifts, change the 
% requiredNumberOfOverlapPixels paramter in normxcorr2_general. 

% All numeric inputs to conv2 (in xcorr2) must be of type double or single,
% see http://www.mathworks.com/help/matlab/ref/conv2.html
Template = double(Template); offsetTemplate = double(offsetTemplate);

cc = normxcorr2_general(Template,offsetTemplate,1e3^2);

[~, imax] = max(abs(cc(:)));
[ypeak, xpeak] = ind2sub(size(cc),imax(1));
corr_offset = [(ypeak-size(Template,1)) (xpeak-size(Template,2))];

corr_offset = [corr_offset(2) corr_offset(1)]; % The first and second elements are for the X and Y axes, respectively.


