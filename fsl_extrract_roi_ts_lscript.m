% a MatLab script to extract time series from the regions of AAL atlas
% http://www.ncbi.nlm.nih.gov/pubmed/11771995 using FSL function fslmeants
% AAL template atlas image is given as aal.nii.gz 
% 
% Description:
% a script to extrct time series from aal.nii.gz atlas 

% Inputs: aal_i.nii.gz where i represents mask/roi i = 1,2,....90 from 
%   the aal.nii.gz atlas template image with 90 regions of interest (ROIs)
%   No of subjects with FSL FEAT images
%   No of AAL rois 
%   Folders with subjects FEAT output images and a folder with aal_i images
%   (see fsl_extract_aal_script.m)

% Outputs:
%  aal_i.txt mean ts from N=90 regions of interest from aal.nii.gz atlas 

% % -------------------------------------------------------------------------------
% created by Vesna Vuksanovic (01/04/2013)
% (V Vuksanović, P Hövel Functional connectivity of distant cortical regions: role of remote synchronization and symmetry in interactions
% NeuroImage (2014) https://doi.org/10.1016/j.neuroimage.2014.04.039)
% % ---------------------------------------------------------------------------------

sub_no = 26;   %%% No of subjects
aal_rois = 90; %%% No of ROIs
input_fold_sub = '/home/vuksanovic_data/fMRI_data/Berlin/sub'; %%% folder with FEAT subjects output 
input_folder_aali = '/home/vuksanovic_data/fMRI_data/AAL/AAL_2/';  %%% folder with aal_i outputs

for i = 1 : sub_no  %%% counts files sub_i
    inputfile1=sprintf('%s',input_fold_sub);  
    newfolder = sprintf('%s_%d/rest',inputfile1,i);   %%% FSL FEAT subfolder
    cd(newfolder);
       for j = 1 : aal_rois
          inputfile2=sprintf('%s',input_folder_aali); %%% folder with aal_i masks extracted   
          extract_ts = sprintf('fslmeants -i rest_transform_2mm.nii.gz -m %s > %s', sprintf('%saal_%d.nii.gz',inputfile2,j), sprintf('aal_%d.txt', j));
          evalname_ts = sprintf('!%s',extract_ts);
          eval(evalname_ts); 
      end
end