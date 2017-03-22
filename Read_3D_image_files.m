function I = Read_3D_image_files(filename,first_Z_layer,last_Z_layer)

%I = Read_3D_image_files([UserData.save_path UserData.reference_filename],UserData.stack_range(1),UserData.stack_range(2));
% I_cy3 = Read_3D_image_files([UserData.save_path 'cy3_03.tif'],UserData.stack_range(1),UserData.stack_range(2));
% I_alexa = Read_3D_image_files([UserData.save_path 'alexa_03.tif'],UserData.stack_range(1),UserData.stack_range(2));

info = imfinfo(filename);

if nargin == 3   
    N_Z_layers = last_Z_layer-first_Z_layer+1;    
elseif nargin == 1
    N_Z_layers = length(info);
end

I = zeros(info(1).Height,info(1).Width,N_Z_layers); % Declaring I make the class of I to be double. Without declaring it is uint16.
for i = 1:N_Z_layers
    I(:,:,i) =  imread(filename,i);
end
