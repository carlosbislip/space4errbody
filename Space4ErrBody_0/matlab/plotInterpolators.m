function [  ] = plotInterpolators( compilation )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

lat_f_deg = 38.9444444444444;
lon_f_deg = -77.4558333333;


% Coordinates for Validation case: Re-entry towards Kourou
if compilation(1).validation == 1
    
    lon_i_deg = -106.7;
    lon_i_rad = deg2rad(lon_i_deg);
    lat_f_deg = 5;
    lon_f_deg = -53;
    validation = 1;
    
end

interpolatorsEvaluationFields  = fieldnames(compilation(end).evolutions(end).population(end).interpolators.ascent.evaluation);
interpolatorInputDataFields  = fieldnames(compilation(end).evolutions(end).population(end).interpolators.ascent.inputData);

phaseList = [{'ascent'} {'descent'}];


%% Interpolators: Angle of Attack - Ascent
%for p = 4:numel(compilation)
    
    for k = 1%:numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459000 + k*1;
            figure(fig_num)
            %set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            %title(strcat('Interpolated AoA for Ascent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).case),'_',' ')))
            ylim([0 50])
            
            xlim([0 1])
            xlabel('$E_{mapped}$ $(-)$','Interpreter','latex') % x-axis label
            ylabel('Angle of Attack $($deg$)$','Interpreter','latex') % y-axis label
            set(gca,'YTick', 0:10:50);
            set(gca,'XTick', 0:.2:1);
            set(gca,'TickLabelInterpreter','latex')
            
            
            
            
            field_x = interpolatorsEvaluationFields{1};
            field_x_struct = compilation(end).evolutions(end).population(end).interpolators.ascent.evaluation.(field_x);
            variableLabel_x = field_x_struct.variableLabel;
            figureSaveName_x = field_x_struct.figureSaveNameContent;
            units_x = field_x_struct.units;
            limits_x12 = field_x_struct.limits;
            limits_x3 = limits_x12;
            scalingFactor_x = field_x_struct.scalingFactor;
            tick_x = field_x_struct.tick;
            
            
            
            field_y = interpolatorsEvaluationFields{2};
            field_y_struct = compilation(end).evolutions(end).population(end).interpolators.ascent.evaluation.(field_y);
            variableLabel_y = field_y_struct.variableLabel;
            figureSaveName_y = field_y_struct.figureSaveNameContent;
            units_y = field_y_struct.units;
            limits_y = field_y_struct.limits;
            scalingFactor_y = field_y_struct.scalingFactor;
            tick_y = field_y_struct.tick;
            
            phase = phaseList{2};
                        
            hold on
            grid on
          
            
            j = 1;
            
            
            %for ii = compilation(p).evolutions(k).population(1).indices.printed
            
            id = [1544 86] + 1;
            p = 1;
            ii = id(p);
            
            h(p) =   plot(compilation(p).evolutions(k).population(ii).interpolators.(phase).evaluation.(field_x).value,...
                compilation(p).evolutions(k).population(ii).interpolators.(phase).evaluation.(field_y).value,'LineWidth',2);
           
            
            scatter( compilation(p).evolutions(k).population(ii).interpolators.(phase).inputData.(field_x).value,...
                compilation(p).evolutions(k).population(ii).interpolators.(phase).inputData.(field_y).value,70,'filled','ks');
            
             ax = gca;
           j = 2;
             ax.ColorOrderIndex = j;
            
            
            p = 2;
            ii = id(p);
            
            h(p)  =   plot(compilation(p).evolutions(k).population(ii).interpolators.(phase).evaluation.(field_x).value,...
                compilation(p).evolutions(k).population(ii).interpolators.(phase).evaluation.(field_y).value,'LineStyle','--','LineWidth',2);
           
            h(3)=scatter( compilation(p).evolutions(k).population(ii).interpolators.(phase).inputData.(field_x).value,...
                compilation(p).evolutions(k).population(ii).interpolators.(phase).inputData.(field_y).value,70,'filled','ks');
            j = j + 1;
            
            legend(h(1:3),[{'Initial Individual'};{'Re-evaluated Individual'};{'Control Nodes'}],'Interpreter','latex')
            
       
            hold off
            
            
            saveas(...
                figure(fig_num),...
                string(strcat(...
                compilation(p).figurePath,...
                'interpolator_',phase,{'_'},figureSaveName_y, {'_vs_'},figureSaveName_x,'_generation_',...
                num2str(k - 1),'_case',convertCharsToStrings(compilation(p).case),'.png')),...
                'png');
            % close(fig_num);
        end
    end
%end





%% Interpolators: Angle of Attack - Descent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459100 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            %title(strcat('Interpolated AoA for Descent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([0 50])
            %max_interp_E_mapped_Descent = max([compilation(p).evolutions.max_interp_E_mapped_Descent]);
            % xlim([0 max_interp_E_mapped_Descent])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Angle of attack (deg)') % y-axis label
            set(gca,'YTick', 0:10:50);
            %   set(gca,'XTick', 0:max_interp_E_mapped_Descent/10:max_interp_E_mapped_Descent);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).population(ii).interpolators.Descent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Descent.Evaluation.angleOfAttack);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).population(ii).interpolators.Descent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Descent.InputData.angleOfAttack);
                
            end
            
            %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorDescentAngleOfAttack_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            %close(fig_num);
        end
    end
end

%% Interpolators: Bank Angle - Ascent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459000 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Interpolated Bank Angle for Ascent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([0 5])
            
            xlim([0 1])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Bank angle (deg)') % y-axis label
            set(gca,'YTick', 0:1:5);
            set(gca,'XTick', 0:1/10:1);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).population(ii).interpolators.Ascent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Ascent.Evaluation.bankAngle);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.bankAngle);
                
            end
            
            
            %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorAscentBankAngle_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            %     close(fig_num);
        end
    end
end

%% Interpolators: Bank Angle - Descent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3439000 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Interpolated Bank Angle for Descent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([0 90])
            %max_interp_E_mapped_Descent = max([compilation(p).evolutions.max_interp_E_mapped_Descent]);
            xlim([0 1])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Bank angle (deg)') % y-axis label
            set(gca,'YTick', 0:15:90);
            set(gca,'XTick', 0:1/10:1);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).population(ii).interpolators.Descent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Descent.Evaluation.bankAngle);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).population(ii).interpolators.Descent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Descent.InputData.bankAngle);
                
            end
            %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorDescentBankAngle_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            % close(fig_num);
        end
    end
end

%% Interpolators: Thrust Elevation Angle - Ascent
for p = 1:numel(compilation)
    
    for k = numel(compilation(p).evolutions):numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459000 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Interpolated eps_T for Ascent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([-30 30])
            % max_tof = max([compilation(p).evolutions.max_tof]);
            
            xlim([0 1])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Thrust Elevation Angle (deg)') % y-axis label
            % set(gca,'YTick', 0:1:10);
            set(gca,'XTick', 0:.2:1);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.Evaluation.thrustElevationAngle);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.InputData.thrustElevationAngle);
                
            end
            
            plot([0 1],[0 0],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorAscentThrustElevationAngle_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            %  close(fig_num);
        end
    end
end

%% Interpolators: Thrust Elevation Angle - Descent
for p = 1:numel(compilation)
    
    for k = numel(compilation(p).evolutions):numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459100 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Interpolated eps_T for Descent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([-30 30])
            % max_tof = max([compilation(p).evolutions.max_tof]);
            %max_interp_E_mapped_Descent = max(abs([compilation(p).evolutions.max_interp_E_mapped_Descent]));
            %xlim([0 max_interp_E_mapped_Descent])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Thrust Elevation Angle (deg)') % y-axis label
            % set(gca,'YTick', 0:1:10);
            % set(gca,'XTick', 0:.2:max_interp_E_mapped_Descent);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.Evaluation.thrustElevationAngle);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.thrustElevationAngle);
                
            end
            
            plot([0 1],[0 0],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorDescentThrustElevationAngle_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            close(fig_num);
        end
    end
end

%% Interpolators: Thrust Azimuth Angle - Ascent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459300 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Interpolated phi_T for Ascent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([-30 30])
            % max_tof = max([compilation(p).evolutions.max_tof]);
            %max_interp_E_mapped_Descent = max(abs([compilation(p).evolutions.max_interp_E_mapped_Descent]));
            %xlim([0 max_interp_E_mapped_Descent])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Thrust Azimuth Angle (deg)') % y-axis label
            % set(gca,'YTick', 0:1:10);
            % set(gca,'XTick', 0:.2:max_interp_E_mapped_Descent);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.Evaluation.thrustAzimuthAngle);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Ascent.InputData.thrustAzimuthAngle);
                
            end
            
            plot([0 1],[0 0],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorAscentThrustAzimuthAngle_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            close(fig_num);
        end
    end
end

%% Interpolators: Thrust Azimuth Angle - Descent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459300 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Interpolated phi_T for Descent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([-30 30])
            % max_tof = max([compilation(p).evolutions.max_tof]);
            %max_interp_E_mapped_Descent = max(abs([compilation(p).evolutions.max_interp_E_mapped_Descent]));
            %xlim([0 max_interp_E_mapped_Descent])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Thrust Azimuth Angle (deg)') % y-axis label
            % set(gca,'YTick', 0:1:10);
            % set(gca,'XTick', 0:.2:max_interp_E_mapped_Descent);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.Evaluation.thrustAzimuthAngle);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.thrustAzimuthAngle);
                
            end
            
            plot([0 1],[0 0],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorDescentThrustAzimuthAngle_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            close(fig_num);
        end
    end
end

%% Interpolators: Throttle Setting - Ascent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            fig_num = p*100 + 3459000 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Throttle Setting for Ascent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([-1 2])
            % max_tof = max([compilation(p).evolutions.max_tof]);
            %        1 = max([compilation(p).evolutions.max_interp_E_mapped]);
            % xlim([0 1])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Throttle Setting (-)') % y-axis label
            % set(gca,'YTick', 0:1:10);
            %set(gca,'XTick', 0:.2:1);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).population(ii).interpolators.Ascent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Ascent.Evaluation.throttleSetting);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.throttleSetting);
                
            end
            
            plot([0 1],[1 1],'k','LineWidth',2)
            plot([0 1],[0 0],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorAscentThrottleSetting_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            close(fig_num);
        end
    end
end

%% Interpolators: Throttle Setting - Descent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
    
        if compilation(p).evolutions(k).population(1).indices.printed > 0
        
            fig_num = p*100 + 3459000 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Throttle Setting for Descent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([-1 2])
            % max_tof = max([compilation(p).evolutions.max_tof]);
            %        1 = max([compilation(p).evolutions.max_interp_E_mapped]);
            % xlim([0 1])
            xlabel('Mapped Energy: E_{mapped}') % x-axis label
            ylabel('Throttle Setting (-)') % y-axis label
            % set(gca,'YTick', 0:1:10);
            %set(gca,'XTick', 0:.2:1);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.Evaluation.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.Evaluation.throttleSetting);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.normalizedSpecificEnergy,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.throttleSetting);
                
            end
            
            plot([0 1],[1 1],'k','LineWidth',2)
            plot([0 1],[0 0],'k','LineWidth',2)
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorDescentThrottleSetting_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            close(fig_num);
        end
    end
end

%% Interpolators: Node Location - Ascent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
    
                if compilation(p).evolutions(k).population(1).indices.printed > 0

                    fig_num = p*100 + 3459000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Node Location for Ascent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 1])
        % max_tof = max([compilation(p).evolutions.max_tof]);
        %        1 = max([compilation(p).evolutions.max_interp_E_mapped]);
        xlim([0 1])
        ylabel('Mapped Energy: E_{mapped}') % x-axis label
        xlabel('Node Location (-)') % y-axis label
        % set(gca,'YTick', 0:1:10);
        %set(gca,'XTick', 0:.2:1);
        hold on
        grid on
        
        
        for ii = compilation(p).evolutions(k).population(1).indices.printed
            h =   plot(compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.nodeLocation,...
                compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.normalizedSpecificEnergy);
            
            set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
            scatter( compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.nodeLocation,...
                compilation(p).evolutions(k).population(ii).interpolators.Ascent.InputData.normalizedSpecificEnergy);
            
        end
        
        
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            compilation(p).figurePath,...
            'interpolatorAscentNodeLocation_Evolution',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        %close(fig_num);
        
    end
    end
end

%% Interpolators: Node Location - Descent
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        
        if compilation(p).evolutions(k).population(1).indices.printed > 0
            
            fig_num = p*100 + 3459000 + k*1;
            figure(fig_num)
            set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
            set (gca,'Fontsize',15)
            title(strcat('Node Location for Descent - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
            ylim([0 1])
            % max_tof = max([compilation(p).evolutions.max_tof]);
            %        1 = max([compilation(p).evolutions.max_interp_E_mapped]);
            xlim([0 1])
            ylabel('Mapped Energy: E_{mapped}') % x-axis label
            xlabel('Node Location (-)') % y-axis label
            % set(gca,'YTick', 0:1:10);
            %set(gca,'XTick', 0:.2:1);
            hold on
            grid on
            
            for ii = compilation(p).evolutions(k).population(1).indices.printed
                h =   plot(compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.nodeLocation,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.normalizedSpecificEnergy);
                
                set(gca, 'ColorOrder', circshift(get(gca, 'ColorOrder'), numel(h)))
                scatter( compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.nodeLocation,...
                    compilation(p).evolutions(k).trajectories(ii).interpolators.Descent.InputData.normalizedSpecificEnergy);
                
            end
            
            
            hold off
            saveas(...
                figure(fig_num),...
                strcat(...
                compilation(p).figurePath,...
                'interpolatorDescentNodeLocation_Evolution',...
                num2str(k - 1),...
                '_Set',...
                convertCharsToStrings(compilation(p).set),...
                '.png'),...
                'png');
            close(fig_num);
        end
    end
end

end
