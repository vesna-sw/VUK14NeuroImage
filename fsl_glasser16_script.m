% a MatLab script to extract the regions from Glasser 2016 atlas https://neurovault.org/collections/1549/
% reference https://www.nature.com/articles/nature18933 
% using FSL functiona fslmath template atlas image is given as MMP_in_MNI_symmetrical_1
% 
% Description
% a script to extrct the egions from GLASSER16.nii.gz atlas (MMP_in_MNI_symmetrical_1.nii.gz) by setting the threshold for the output
% image as 1, 2 , ...90, that is, the intensity of the aal reagions, using fsl function
% fslmaths ATLAS.nii.gz -thr 1 -uthr 1 -roi 0 -1 0 -1 0 -1 0 -1  ATLAS_1.nii.gz

%Inputs:
%   ATLAS.nii.gz a GLASSER16.nii.gz atlas template image with 180 regions
%   of interest (ROIs) per hemsphere

%Outputs:
%  360 regions of interest from GLASSER16.nii.gz atlas masked 

% % -------------------------------------------------------------------------------
% created by Vesna Vuksanovic (01/04/2013)
% (V Vuksanović, P Hövel Functional connectivity of distant cortical regions: role of remote synchronization and symmetry in interactions
% NeuroImage (2014) https://doi.org/10.1016/j.neuroimage.2014.04.039)
% % ---------------------------------------------------------------------------------

atlasfolder = '~/Data/Atlases_Parcellation/Glasser16/';   %%% folder with aal.nii atlas image  
cd(atlasfolder)
atlasrois = 360;  %%% number of regions
 
 for j = 1 : atlasrois      
     extract_aal = sprintf('fslmaths MMP_in_MNI_symmetrical_1.nii.gz -thr %d -uthr %d -roi 0 -1 0 -1 0 -1 0 -1 glasser16_%d.nii.gz', j, j, j);
     evalname_gls = sprintf('!%s',extract_aal);
     eval(evalname_gls);
 end





