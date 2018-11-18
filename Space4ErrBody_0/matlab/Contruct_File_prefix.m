function [Folder_Path_List,prop_File_Path_List_prefix,depvar_File_Path_List_prefix,interp_File_Path_List_prefix,pop_file_path_prefix,fit_file_path_prefix] = ...
    Contruct_File_prefix(Output_Location,Folder_prefix,prop_File_prefix,depvar_File_prefix,interp_File_prefix,pop_Location,pop_prefix,fit_Location,fit_prefix)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Folders_Containing_Simulations = dir([Output_Location Folder_prefix]);
Folder_Path_List = fullfile(Output_Location,{Folders_Containing_Simulations.name}');
prop_File_Path_List_prefix = fullfile(Folder_Path_List,prop_File_prefix);
depvar_File_Path_List_prefix = fullfile(Folder_Path_List,depvar_File_prefix);
interp_File_Path_List_prefix = fullfile(Folder_Path_List,interp_File_prefix);

pop_file_path_prefix = cellstr(fullfile(Folder_Path_List,pop_prefix));
fit_file_path_prefix = cellstr(fullfile(Folder_Path_List,fit_prefix));
end

