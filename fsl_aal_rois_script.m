% a MatLab script to extract the regions from AAL atlas
% http://www.ncbi.nlm.nih.gov/pubmed/11771995 using FSL functiona fslmath
% AAL template atlas image is given as aal.nii.gz 
% 
% Description
% a script to extrct the egions from aal.nii.gz atlas by setting the threshold for the output
% image as 1, 2 , ...90, that is, the intensity of the aal reagions, using fsl function
% fslmaths aal.nii.gz -thr 1 -uthr 1 -roi 0 -1 0 -1 0 -1 0 -1  aal_1.nii.gz

%Inputs:
%   aal.nii.gz a aal.nii.gz atlas template image with 90 regions of
%   interest (ROIs)

%Outputs:
%  aal_i (i=1,2,....90) masks/rois from aal.nii.gz atlas 

% % -------------------------------------------------------------------------------
% created by Vesna Vuksanovic (01/04/2013)
% (V Vuksanović, P Hövel Functional connectivity of distant cortical regions: role of remote synchronization and symmetry in interactions
% NeuroImage (2014) https://doi.org/10.1016/j.neuroimage.2014.04.039)
% % ---------------------------------------------------------------------------------

aalfolder = '/home/vuksanovic_data/fMRI_data/AAL/';   %%% folder with aal.nii atlas image  
cd(aalfolder)
aal_rois = 90;
 
 for j = 1 : aal_rois      
     extract_aal = sprintf('fslmaths aal.nii.gz -thr %d -uthr %d -roi 0 -1 0 -1 0 -1 0 -1 aal_%d.nii.gz', j, j, j);
     evalname = sprintf('!%s',extract_aal)
     eval(evalname)
 end
 