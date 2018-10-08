function [evolutions,prop_path,depvar_path,v_i,gamma_i,chi_i,lat_f,lon_f,pop_path,...
                pop_i,fit_path,fit_i,output] = Path_Prep(option,p,...
                prop_File_Path_List_prefix,depvar_File_Path_List_prefix,...
                Folder_Path_List,pop_file_path_prefix,fit_file_path_prefix)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here


% Read in folder content
[prop_Output_files,n_prop_Output_files,depvar_Output_files,n_depvar_Output_files,pop_files,npop_files,fit_files,nfit_files] = Read_Folder_Content(p,prop_File_Path_List_prefix,depvar_File_Path_List_prefix,pop_file_path_prefix,fit_file_path_prefix);

% Construct all file paths to evaluate
[prop_path,depvar_path,v_i,gamma_i,chi_i,lat_f,lon_f,pop_path,pop_i,fit_path,fit_i] = Contruct_File_Paths(prop_Output_files,n_prop_Output_files,depvar_Output_files,n_depvar_Output_files,pop_files,npop_files,fit_files,nfit_files);

% Load lists of analyzed simulations and determine remaining paths to analyze
[evolutions,output] = Load_Data(option,p,Folder_Path_List,pop_path,npop_files );

% Determine if all paths have been analyzed. If so, then plot and got to next folder.
%idx = idx(~isnan(idx));



end

