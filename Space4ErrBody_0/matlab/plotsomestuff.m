function [  ] = plotsomestuff( compilation, mainpath )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


%% Load lists of analyzed simulations

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


%% Interpolators: Angle of Attack
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3459000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Interpolated AoA - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 10])
         max_interp_E_mapped = max([compilation(p).evolutions.max_interp_E_mapped]);
        xlim([0 max_interp_E_mapped])
        xlabel('Mapped Energy: E_{mapped}') % x-axis label
        ylabel('Angle of attack (deg)') % y-axis label
        %set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:.2:max_interp_E_mapped);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.interp_E_mapped,...
                compilation(p).evolutions(k).trajectories(ii).individual.interp_angle_of_attack);
            scatter(compilation(p).evolutions(k).trajectories(ii).individual.DV_E_mapped,...
                compilation(p).evolutions(k).trajectories(ii).individual.DV_angle_of_attack);
        end
       
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/interp_AoA_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Interpolators: Thrust Elevation Angle
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3459000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Interpolated eps_T - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 10])
        % max_tof = max([compilation(p).evolutions.max_tof]);
         max_interp_E_mapped = max([compilation(p).evolutions.max_interp_E_mapped]);
        xlim([0 max_interp_E_mapped])
        xlabel('Mapped Energy: E_{mapped}') % x-axis label
        ylabel('Thrust Elevation Angle (deg)') % y-axis label
        % set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:.2:max_interp_E_mapped);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.interp_E_mapped,...
                compilation(p).evolutions(k).trajectories(ii).individual.interp_thrust_angle);
                        scatter(compilation(p).evolutions(k).trajectories(ii).individual.DV_E_mapped,...
                compilation(p).evolutions(k).trajectories(ii).individual.DV_thrust_angle);
        end
       
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/interp_eps_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Interpolators: Throttle Setting
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3459000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Throttle Setting - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 1])
        % max_tof = max([compilation(p).evolutions.max_tof]);
         max_interp_E_mapped = max([compilation(p).evolutions.max_interp_E_mapped]);
        xlim([0 max_interp_E_mapped])
        xlabel('Mapped Energy: E_{mapped}') % x-axis label
        ylabel('Throttle Setting (-)') % y-axis label
        % set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:.2:max_interp_E_mapped);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.interp_E_mapped,...
                compilation(p).evolutions(k).trajectories(ii).individual.interp_throttle_setting);
                                    scatter(compilation(p).evolutions(k).trajectories(ii).individual.DV_E_mapped,...
                compilation(p).evolutions(k).trajectories(ii).individual.DV_throttle_setting);
        end
       
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/interp_throttle_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end
%% Time History: Aero G-load - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3457000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Aero G-load through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 5])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Aero G-load (g)') % y-axis label
        set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:50:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.total_aero_g_load);
        end
        
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/aero_g_load_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
  end  
end

%% Time History: Thrust Acc. Components - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3465000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Thrust Components through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 5])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Thrust Acc. Components (m/s^2)') % y-axis label
        %set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:50:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.acc_thru_x,'k');
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.acc_thru_y,'r');
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.acc_thru_z,'b');
        end
     legend('x-dir','y-dir','z-dir')

        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/Thrust_acc_components_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
   end
end



%% Time History: Thrust Acc. Magnitude - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3465100 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Thrust Acc. Magnitude through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 5])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Thrust Acc. Magnitude (m/s^2)') % y-axis label
        %set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:50:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.acc_thru_M);

        end
     %legend('x-dir','y-dir','z-dir')

        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/Thrust_acc_magnitude_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
   end
end

%% Time History: Airspeed - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3466000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Airspeed through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 5])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Airspeed (m/s)') % y-axis label
        %set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:50:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.airspeed);
        end
     
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/airspeed_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
   end
end

%% Time History: Mach - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3466000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Mach through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 5])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Mach (-)') % y-axis label
        %set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:50:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.mach);
        end
     
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/mach_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
   end
end

%% Time History: Mass rate - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3476000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Mass rate through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 5])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Mass Rate (kg/s)') % y-axis label
        %set(gca,'YTick', 0:1:10);
        set(gca,'XTick', 0:50:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.mass_rate);
        end
      
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/massRate_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
   end
end

% 
%% Time History: Specific Energy - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3457000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Specific E through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        %ylim([0 2e6])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Specific Energy (E)') % y-axis label
       % set(gca,'YTick', 0:2e5:2e6);
        set(gca,'XTick', 0:50:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.E);
        end
        
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/E_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end


%% Time History: Normalized Specific Energy - per Evolution
for p = 1:numel(compilation)
    
    
    a = 301.7;
    R_E = 6.378137e6;
    h_UP = 122000;
    mu = 3.986004418e14;
    omega_E = 7.292115e-5;
    % double V_i = a * Mach_i;
    V_f = 0.99 * sqrt( mu / ( R_E + h_UP ) );
    %double E_min = g0 * h_i + 0.5 * V_i * V_i;
    E_max = 9.80665 * h_UP + 0.5 * V_f * V_f;
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 3458000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Normalized Specific Energy through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        % ylim([0 .11])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Normalized Specific Energy') % y-axis label
        % set(gca,'YTick', 0:.1);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.E_hat);
        end
        
        %plot([0 max_tof],(10)*[0 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/E_hat_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end



% %% Termination State on 2D Map - per Set
% %close all
% for p = 1:numel(compilation)
%     fig_num = p + 100;
%     figure(fig_num)
%     hold on
%     title(strcat('Termination State - per Set',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     xlabel('\tau (deg)') % x-axis label
%     ylabel('\delta (deg)') % y-axis label
%     img = imread('img.jpg');
%     imagesc([-180 180], [-90 90], (flipud(img)));
%     set (gca,'Fontsize',20)
%     set(gca,'YTick', -90:15:90);
%     set(gca,'XTick', -180:30:180);
%     xlim([-180 180])
%     ylim([-90 90])
%     for k = 1:numel(compilation(p).evolutions)
%         %         for ii = 1:numel(compilation(p).evolutions(k).trajectories)
%         %         terminal_lat(ii) =  compilation(p).evolutions(k).trajectories(ii).individual.latitude_angle(end);
%         %                    lons(ii) =  compilation(p).evolutions(k).trajectories(ii).individual.longitude_angle(end);
%         %
%         %
%         %         end
%         scatter(...
%             compilation(p).evolutions(k).individuals.lon_f_deg,...
%             compilation(p).evolutions(k).individuals.lat_f_deg,'x')
%         legendtext(k) = cellstr(strcat(strrep(convertCharsToStrings(compilation(p).set),'_',' '),' - Evolution:_{ } ', num2str(k-1)));
%     end
%     
%     plot(lon_f_deg,lat_f_deg,'MarkerSize',20)
%     plot(lon_f_deg*[1 1],90*[-1 1],'k','LineWidth',2)
%     plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
%     
     th = 0:pi/50:2*pi;
     xunit = .75 * cos(th) + lon_f_deg;
     yunit = .75 * sin(th) + lat_f_deg;
%     plot(xunit, yunit,'k','LineWidth',2);
%     scatter(lon_f_deg,lat_f_deg,100,'r','x')
%     axP = get(gca,'Position');
%     legend(legendtext,'Location','southeastoutside')
%     set(gca, 'Position', axP)
%     
%     clear legendtext
%     %xlim([(lon_IAD_deg - 20) (lon_IAD_deg + 20)])
%     %ylim([(lat_IAD_deg - 10) (lat_IAD_deg + 10)])
%     hold off
%     saveas(...
%         figure(fig_num),...
%         strcat(...
%         mainpath,...
%         '/figures/Termination_State_2D_Map_per_Set',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     
% end
% 
% %% Termination State on 2D Map - Zoom - per Set
% 
% for p = 1:numel(compilation)
%     fig_num = p + 100;
%     figure(fig_num)
%     hold on
%     title(strcat('Termination State - Zoom - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     xlabel('\tau (deg)') % x-axis label
%     ylabel('\delta (deg)') % y-axis label
%     img2 = imread('img.jpg');
%     imagesc([-180 180], [-90 90], (flipud(img2)));
%     set (gca,'Fontsize',20)
%     set(gca,'YTick', -90:1:90);
%     set(gca,'XTick', -180:1:180);
%     xlim([(lon_f_deg - 10) (lon_f_deg + 10)])
%     ylim([(lat_f_deg - 5) (lat_f_deg + 5)])
%     
%     for k = 1:numel(compilation(p).evolutions)
%         scatter(...
%             compilation(p).evolutions(k).individuals.lon_f_deg,...
%             compilation(p).evolutions(k).individuals.lat_f_deg,'x')
%         legendtext(k) = cellstr(strcat(strrep(convertCharsToStrings(compilation(p).set),'_',' '),' - Evolution:_{ } ', num2str(k-1)));
%     end
%     
%     plot(lon_f_deg*[1 1],90*[-1 1],'k','LineWidth',2)
%     plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
%     plot(xunit, yunit,'k','LineWidth',2);
%     scatter(lon_f_deg,lat_f_deg,100,'r','x')
%     axP = get(gca,'Position');
%     legend(legendtext,'Location','southeastoutside')
%     set(gca, 'Position', axP)
%     clear legendtext
%     
%     hold off
%     
%     print(figure(fig_num),'MySavedPlot','-dpng')
%     
%     saveas(...
%         figure(fig_num),...
%         strcat(...
%         mainpath,...
%         '/figures/Termination_State_2D_Map_Zoom_per_Set',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     
% end

%% Trajectories on 2D Map - per Set
%close all
for p = 1:numel(compilation)
    fig_num = p + 300;
    figure(fig_num)
    hold on
    title(strcat('Trajectories - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
    set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
    xlabel('\tau (deg)') % x-axis label
    ylabel('\delta (deg)') % y-axis label
    img = imread('img.jpg');
    imagesc([-180 180], [-90 90], (flipud(img)));
    set (gca,'Fontsize',20)
    set(gca,'YTick', -90:15:90);
    set(gca,'XTick', -180:30:180);
    xlim([-180 180])
    ylim([-90 90])
    
    for k = 1:numel(compilation(p).evolutions)
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(...
                compilation(p).evolutions(k).trajectories(ii).individual.longitude_angle,...
                compilation(p).evolutions(k).trajectories(ii).individual.latitude_angle)
            legendtext(k) = cellstr(strcat(strrep(convertCharsToStrings(compilation(p).set),'_',' '),' - Evolution:_{ } ', num2str(k-1)));
        end
    end
    
    plot(lon_f_deg,lat_f_deg,'MarkerSize',20)
    plot(lon_f_deg*[1 1],90*[-1 1],'k','LineWidth',2)
    plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
    plot(xunit, yunit,'k','LineWidth',2);
    scatter(lon_f_deg,lat_f_deg,100,'r','x')
    axP = get(gca,'Position');
    %  legend(legendtext,'Location','southeastoutside')
    set(gca, 'Position', axP)
    
    clear legendtext
    %xlim([(lon_IAD_deg - 20) (lon_IAD_deg + 20)])
    %ylim([(lat_IAD_deg - 10) (lat_IAD_deg + 10)])
    hold off
    saveas(...
        figure(fig_num),...
        strcat(...
        mainpath,...
        '/figures/Trajectories_2D_Map_Set',...
        convertCharsToStrings(compilation(p).set)',...
        '.png'),...
        'png');
    close(fig_num);
    
end
% 
% %% Trajectories on 2D Map - Zoom - per Set
% %close all
% for p = 1:numel(compilation)
%     fig_num = p + 310;
%     figure(fig_num)
%     hold on
%     title(strcat('Trajectories - Zoom - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     xlabel('\tau (deg)') % x-axis label
%     ylabel('\delta (deg)') % y-axis label
%     img = imread('img.jpg');
%     imagesc([-180 180], [-90 90], (flipud(img)));
%     set (gca,'Fontsize',20)
%     set(gca,'YTick', -90:1:90);
%     set(gca,'XTick', -180:1:180);
%     xlim([(lon_f_deg - 10) (lon_f_deg + 10)])
%     ylim([(lat_f_deg - 5) (lat_f_deg + 5)])
%     
%     if compilation(1).validation == 1
%         xlim([-72 -52])
%         ylim([-3 7])
%         
%     end
%     
%     for k = 1:numel(compilation(p).evolutions)
%         for ii = 1:numel(compilation(p).evolutions(k).trajectories)
%             plot(...
%                 compilation(p).evolutions(k).trajectories(ii).individual.longitude_angle,...
%                 compilation(p).evolutions(k).trajectories(ii).individual.latitude_angle)
%             legendtext(k) = cellstr(strcat(strrep(convertCharsToStrings(compilation(p).set),'_',' '),' - Evolution:_{ } ', num2str(k-1)));
%         end
%     end
%     
%     plot(lon_f_deg,lat_f_deg,'MarkerSize',20)
%     plot(lon_f_deg*[1 1],90*[-1 1],'k','LineWidth',2)
%     plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
%     plot(xunit, yunit,'k','LineWidth',2);
%     scatter(lon_f_deg,lat_f_deg,100,'r','x')
%     axP = get(gca,'Position');
%     % legend(legendtext,'Location','southeastoutside')
%     set(gca, 'Position', axP)
%     
%     clear legendtext
%     %xlim([(lon_IAD_deg - 20) (lon_IAD_deg + 20)])
%     %ylim([(lat_IAD_deg - 10) (lat_IAD_deg + 10)])
%     hold off
%     saveas...
%         (figure(fig_num),...
%         strcat(...
%         mainpath,...
%         '/figures/Trajectories_2D_Map_Zoom_Set',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     
% end
% 
% 
% %% Trajectory on 2D Map - Zoom - per Evolution
% %close all
% for p = 1:numel(compilation)
%     
%     for k = 1:numel(compilation(p).evolutions)
%         
%         fig_num = p*10 + 310 + k;
%         figure(fig_num)
%         hold on
%         title(strcat('Trajectories - Zoom - Evolution:_{ }',num2str(k - 1),' Set:_{ } ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%         set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%         xlabel('\tau (deg)') % x-axis label
%         ylabel('\delta (deg)') % y-axis label
%         img = imread('img.jpg');
%         imagesc([-180 180], [-90 90], (flipud(img)));
%         set (gca,'Fontsize',20)
%         set(gca,'YTick', -90:1:90);
%         set(gca,'XTick', -180:1:180);
%         xlim([(lon_f_deg - 10) (lon_f_deg + 10)])
%         ylim([(lat_f_deg - 5) (lat_f_deg + 5)])
%         
%         if compilation(1).validation == 1
%             
%             xlim([-72 -52])
%             ylim([-3 7])
%             
%         end
%         
%         for ii = 1:numel(compilation(p).evolutions(k).trajectories)
%             
%             plot(...
%                 compilation(p).evolutions(k).trajectories(ii).individual.longitude_angle,...
%                 compilation(p).evolutions(k).trajectories(ii).individual.latitude_angle,'LineWidth',2)
%             %legendtext(k) = cellstr(strcat(strrep(convertCharsToStrings(compilation(p).set),'_',' '),' - Evolution:_{ } ', num2str(k-1)));
%             
%         end
%         
%         plot(lon_f_deg,lat_f_deg,'MarkerSize',20)
%         plot(lon_f_deg*[1 1],90*[-1 1],'k','LineWidth',2)
%         plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
%         plot(xunit, yunit,'k','LineWidth',2);
%         scatter(lon_f_deg,lat_f_deg,100,'r','x')
%         axP = get(gca,'Position');
%         % legend(legendtext,'Location','southeastoutside')
%         set(gca, 'Position', axP)
%         
%         clear legendtext
%         %xlim([(lon_IAD_deg - 20) (lon_IAD_deg + 20)])
%         %ylim([(lat_IAD_deg - 10) (lat_IAD_deg + 10)])
%         hold off
%         saveas(...
%             figure(fig_num),...
%             strcat(mainpath,...
%             '/figures/Trajectories_2D_Map_Zoom_Evolution_',...
%             num2str(k - 1),...
%             '_Set',...
%             convertCharsToStrings(compilation(p).set),...
%             '.png'),...
%             'png');
%         close(fig_num);
%         
%     end
% end
% 
% 
% %% Plot Trajectories on 3D Earth
% %
% % for p = 1:numel(compilation)
% %
% %     figure(p + 200)
% %     hold on
% %     title(strcat('Trajectory on spherical Earth - 1',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
% %     %set(figure(p + 200),'units','pixels','position',[0,0,1200,600])
% %     %   xlabel('\tau (deg)') % x-axis label
% %     %   ylabel('\delta (deg)') % y-axis label
% %     %   imagesc([-180 180], [-90 90], (flipud(img)));
% %     set (gca,'Fontsize',20)
% %     set(gca,'XTick',[], 'YTick', [])
% %
% %     axis('off');
% %     XTickLabel = [];
% %     YTickLabel = [];
% %     plotearth('Maptype','bluemarble','NEOMap',...
% %         '/Users/bislip/Cloud Storage/OneDrive/School/TUDelft/Space Flight/Thesis/code/PlotEarth/PlotEarth/BlueMarble.png',...
% %         'SampleStep',1,'FullColor',true,'Shape','spheroid',...
% %         'viewpoint', [44 -5],p + 200,p + 200);
% %
% %     for i = 1:numel(compilation(p).evolutions)
% %         for k = 1:numel(compilation(p).evolutions(i).trajectories)
% %             color_line3(...
% %                 compilation(p).evolutions(i).trajectories(k).individual.x_R,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.y_R,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.z_R,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.time_vector);
% %             scatter3(...
% %                 compilation(p).evolutions(i).trajectories(k).individual.x_R(1),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.y_R(1),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.z_R(1),'filled')
% %             scatter3(...
% %                 compilation(p).evolutions(i).trajectories(k).individual.x_R(end),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.y_R(end),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.z_R(end),'filled')
% %         end
% %     end
% %     % view([12,-5])
% %     ax = gca;               % get the current axis
% %     ax.Clipping = 'off';
% %     hold off
% %     saveas(figure(fig_num),strcat(mainpath,'/figures/Trajectories_3D_Map_1_Set',convertCharsToStrings(compilation(p).set),'.png'));
% %
% % end
% %
% %
% %
% %
% %
% % %% Plot Trajectories on 3D Earth
% %
% % for p = 1:numel(compilation)
% %
% %     figure(p + 300)
% %     hold on
% %     title(strcat('Trajectory on spherical Earth - 2',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
% %     %set(figure(p + 200),'units','pixels','position',[0,0,1200,600])
% %     %   xlabel('\tau (deg)') % x-axis label
% %     %   ylabel('\delta (deg)') % y-axis label
% %     %   imagesc([-180 180], [-90 90], (flipud(img)));
% %     set (gca,'Fontsize',20)
% %     set(gca,'XTick',[], 'YTick', [])
% %
% %     axis('off');
% %     XTickLabel = [];
% %     YTickLabel = [];
% %     plotearth('Maptype','bluemarble','NEOMap',...
% %         '/Users/bislip/Cloud Storage/OneDrive/School/TUDelft/Space Flight/Thesis/code/PlotEarth/PlotEarth/BlueMarble.png',...
% %         'SampleStep',1,'FullColor',true,'Shape','spheroid',...
% %         'viewpoint', [-3 13],p + 300,p + 300);
% %
% %     for i = 1:numel(compilation(p).evolutions)
% %         for k = 1:numel(compilation(p).evolutions(i).trajectories)
% %             color_line3(...
% %                 compilation(p).evolutions(i).trajectories(k).individual.x_R,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.y_R,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.z_R,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.time_vector);
% %             scatter3(...
% %                 compilation(p).evolutions(i).trajectories(k).individual.x_R(1),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.y_R(1),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.z_R(1),'filled')
% %             scatter3(...
% %                 compilation(p).evolutions(i).trajectories(k).individual.x_R(end),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.y_R(end),...
% %                 compilation(p).evolutions(i).trajectories(k).individual.z_R(end),'filled')
% %         end
% %     end
% %     % view([12,-5])
% %     ax = gca;               % get the current axis
% %     ax.Clipping = 'off';
% %     hold off
% %     saveas(figure(fig_num),strcat(mainpath,'/figures/Trajectories_3D_Map_2_Set',convertCharsToStrings(compilation(p).set),'.png'));
% %
% % end
% 
% 
% 
% %%
% % for p = 1:numel(compilation)
% %
% % %r = nan(1e6,26);
% % %t = nan(1e6,26);
% % figure(p + 400)
% % set(figure(p + 400),'units','pixels','position',[0,0,1200,600])
% % title('Trajectory in 3D - clipping disabled')
% % set (gca,'Fontsize',15)
% % xlabel('x (km) - Eath-Fixed') % x-axis label
% % ylabel('y (km) - Eath-Fixed') % y-axis label
% % zlabel('z (km) - Eath-Fixed') % z-axis label
% % xlim([4e3 5e3])
% % ylim([-6.5e3 0])
% % zlim([4.75e3 5.5e3])
% %
% % set(gca,'XTick', 4e3:.25e3:5e3);
% % set(gca,'YTick', -6.5e3:1e3:0e3);
% % set(gca,'zTick', 4.75e3:0.05e3:5.5e3);
% %
% % hold on
% % for k = 1:numel(compilation(p).evolutions(i).trajectories)
% %
% %
% %
% %
% %     plot3(compilation(p).evolutions(i).trajectories(k).individual.x_R/1e3,...
% %         compilation(p).evolutions(i).trajectories(k).individual.y_R/1e3,...
% %         compilation(p).evolutions(i).trajectories(k).individual.z_R/1e3);
% %
% %                 scatter3(compilation(p).evolutions(i).trajectories(k).individual.x_R(end)/1e3,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.y_R(end)/1e3,...
% %                 compilation(p).evolutions(i).trajectories(k).individual.z_R(end)/1e3,'filled')
% %
% % end
% % view([44 -5])
% % ax = gca;               % get the current axis
% % ax.Clipping = 'off';
% % hold off
% %
% % saveas(gcf,strcat(mainpath,'/figures/Trajectory in 3D - 1 - ',strrep(convertCharsToStrings(compilation(p).set),'_',' '),'.png'));
% % end
% 
% %% Grid Visualization: v_i, gamma_i, and chi_i
% 
% % for p = 1:numel(compilation)
% %
% %     figure(p +500)
% %     hold on
% %     title(strcat('Inter-Continental Ballistic Tajectory - Cases tested -_{ } ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
% %     set(figure(p+500),'units','pixels','position',[0,0,1200,600])
% %     set (gca,'Fontsize',20)
% %        extents1 = 8e3;
% % extents2 = 90;
% % extents3 = 360;
% % %plot3(extents1*[0 1],[0 0],[0 0],'k')
% % %plot3([0 0],extents2*[0 1],[0 0],'k')
% % %plot3([0 0],[0 0],extents3*[0 1],'k')
% % xlim(extents1*[0 1])
% % ylim(extents2*[0 1])
% % %zlim(extents3*[0 1])
% % grid on
% % xlabel('v_i (deg)') % x-axis label
% % ylabel('\gamma_i (deg)') % y-axis label
% % zlabel('\chi_i (deg)') % y-axis label
% %      view([36,15])
% %
% %     for i = 1:numel(compilation(p).evolutions)
% %             scatter3(compilation(p).evolutions(i).v_i,...
% %                 compilation(p).evolutions(i).gamma_i,...
% %                 compilation(p).evolutions(i).chi_i);
% %
% %
% %     end
% %
% %     hold off
% %         saveas(gcf,strcat(mainpath,'/figures/Inter-Continental Ballistic Tajectory - Cases tested -_{ } ',strrep(convertCharsToStrings(compilation(p).set),'_',' '),'.png'));
% %
% % end
% 
% 

%% Time History: Angle of Attack - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 6000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Angle of Attack  through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([-10 30])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Angle of Attack (deg)') % y-axis label
        set(gca,'YTick', -10:5:30);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.angle_of_attack);
        end
        
        %plot([0 max_tof],(6371 + 25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/AoA_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
       % close(fig_num);
    end
end

%% Time History: Flight-Path Angle - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 654000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Flight-Path Angle through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([-90 90])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Flight-Path Angle (deg)') % y-axis label
        set(gca,'YTick', -90:30:90);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.flight_path_angle);
        end
        
        %plot([0 max_tof],(6371 + 25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/flight_path_angle_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
       % close(fig_num);
    end
end


%% Time History: Heating Rate - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 654430 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Heating Rate through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 100])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Heating Rate (MW/m)') % y-axis label
        set(gca,'YTick', 0:10:100);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.heating_rate/1e6);
        end
        
        %plot([0 max_tof],(6371 + 25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/heating_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end


%% Time History: Dynamic Pressure - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 654180 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Dynamic Pressure through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
       % ylim([-90 90])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Dynamic Pressure (Pa)') % y-axis label
        %set(gca,'YTick', -90:30:90);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.dynamic_pressure);
        end
        
        %plot([0 max_tof],(6371 + 25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/dynamic_pressure_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Time History: Throttle - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Throttle through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 1])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Throttle (-)') % y-axis label
        set(gca,'YTick', 0:.1:1);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.throttle);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/throttle_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Time History: Engine Status - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Engine Status through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 1])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Engine Status (-)') % y-axis label
        set(gca,'YTick', 0:.1:1);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.engine_status);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/engine_status_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Time History: Mass - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Mass through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([25000 60000])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Mass (kg)') % y-axis label
        set(gca,'YTick', 25000:5000:60000);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.mass);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/mass_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end


%% Time History: Thrust Elevation Angle - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Thrust Elevation Angle through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([-30 30])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Thrust Elevation Angle (deg)') % y-axis label
        set(gca,'YTick', -30:5:30);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.thrust_angle);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/thrust_angle_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Time History: Distance Traveled - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Distance Traveled through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 180])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Distance Traveled (deg)') % y-axis label
        set(gca,'YTick', 0:30:180);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.distance_traveled);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/distance_traveled_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Time History: Distance To Go - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Distance To Go through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 180])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Distance To Go (deg)') % y-axis label
        set(gca,'YTick', 0:30:180);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.distance_to_go);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/distance_to_go_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Time History: Heading to Target - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Heading to Target through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([-180 180])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Heading to Target (deg)') % y-axis label
        set(gca,'YTick', -180:30:180);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.heading_to_target);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/heading_to_target_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end



%% Time History: Heading Error - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 723000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Heading Error through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([-60 60])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Heading Error (deg)') % y-axis label
        set(gca,'YTick', -60:15:60);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.heading_error);
        end
        
        %plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/heading_error_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Time History: Height - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 823000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Height through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 150])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Height (km)') % y-axis label
        set(gca,'YTick', 0:10:150);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.height/1e3);
        end
        
        plot([0 max_tof],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/height_v_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end

%% Height vs. Velocity - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 724000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('Height vs. Velocity - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([0 150])
       % max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 8000])
        xlabel('Velocity (m/s)') % x-axis label
        ylabel('Height (km)') % y-axis label
        set(gca,'YTick', 0:10:150);
        set(gca,'XTick', 0:500:8000);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.airspeed,...
                compilation(p).evolutions(k).trajectories(ii).individual.height/1e3);
        end
        
        plot([0 8000],(25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/height_v_V_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
       % close(fig_num);
    end
end

%% Time History: Radial Distance - per Evolution
for p = 1:numel(compilation)
    
    for k = 1:numel(compilation(p).evolutions)
        fig_num = p*100 + 6000 + k*1;
        figure(fig_num)
        set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
        set (gca,'Fontsize',15)
        title(strcat('R_{norm} through Time - Evolution:_{ }',num2str(k - 1),' - ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
        ylim([6.35e3 6.6e3])
        max_tof = max([compilation(p).evolutions.max_tof]);
        xlim([0 max_tof])
        xlabel('Propagation Time (s)') % x-axis label
        ylabel('Radial Distance (km)') % y-axis label
        set(gca,'YTick', 6.350e3:0.05e3:6.5e3);
        set(gca,'XTick', 0:200:max_tof);
        hold on
        
        for ii = 1:numel(compilation(p).evolutions(k).trajectories)
            plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
                compilation(p).evolutions(k).trajectories(ii).individual.altitude/1e3);
        end
        
        plot([0 max_tof],(6371 + 25)*[1 1],'k','LineWidth',2)
        hold off
        saveas(...
            figure(fig_num),...
            strcat(...
            mainpath,...
            '/figures/altitude_T_Evolution_',...
            num2str(k - 1),...
            '_Set',...
            convertCharsToStrings(compilation(p).set),...
            '.png'),...
            'png');
        close(fig_num);
    end
end
% 
% 
% %% Time History: Radial Distance - per Set
% for p = 1:numel(compilation)
%     
%     fig_num = p + 7000;
%     figure(fig_num)
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     set (gca,'Fontsize',15)
%     title(strcat('R_{norm} through Time - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     ylim([6.35e3 6.6e3])
%     max_tof = max([compilation(p).evolutions.max_tof]);
%     xlim([0 max_tof])
%     xlabel('Propagation Time (s)') % x-axis label
%     ylabel('Radial Distance (km)') % y-axis label
%     set(gca,'YTick', 6.350e3:0.05e3:6.6e3);
%     set(gca,'XTick', 0:200:max_tof);
%     hold on
%     
%     for k = 1:numel(compilation(p).evolutions)
%         
%         for ii = 1:numel(compilation(p).evolutions(k).trajectories)
%             plot(compilation(p).evolutions(k).trajectories(ii).individual.time_vector,...
%                 compilation(p).evolutions(k).trajectories(ii).individual.R_R_norm/1e3);
%         end
%     end
%     
%     plot([0 max_tof],(6371 + 25)*[1 1],'k','LineWidth',2)
%     hold off
%     saveas(figure(fig_num),strcat(mainpath,'/figures/R_norm_v_T_Set',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     
% end
% 
% 
% 
% 
% %% 'Best' values
% for p = 1:numel(compilation)
%     
%     for k = 1:numel(compilation(p).evolutions)
%         best_gamma_i(k,:)   = [compilation(p).evolutions(k).best.gamma_i];
%         best_chi_i(k,:)     = [compilation(p).evolutions(k).best.chi_i];
%         best_dif_d_deg(k,:) = [compilation(p).evolutions(k).best.dif_d_deg];
%         best_dif_h(k,:)     = [compilation(p).evolutions(k).best.dif_h];
%         best_tof(k,:)       = [compilation(p).evolutions(k).best.tof];
%     end
%     legendtext = [{'Minimum d_{deg} offset'} {'Minimum height offset'} {'Minimum tof'}];
%     
%     fig_num = p + 8000 + 1;
%     figure(fig_num)
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     set (gca,'Fontsize',15)
%     title(strcat('"Best" - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     % ylim([6.35e3 6.6e3])
%     %     max_tof = max([compilation(p).evolutions.max_tof]);
%     %xlim([0 max_tof])
%     xlabel('Evolution') % x-axis label
%     ylabel('Flight-path angle (deg)') % y-axis label
%     %set(gca,'YTick', 6.350e3:0.05e3:6.6e3);
%     %set(gca,'XTick', 0:200:max_tof);
%     hold on
%     for ii = 1:3
%         plot(linspace(1,size(best_gamma_i,1),size(best_gamma_i,1))-1,best_gamma_i(:,ii));
%     end
%     legend(legendtext,'Location','southeastoutside')
%     saveas(figure(fig_num),strcat(mainpath,...
%         '/figures/best_flight_path_per_evolution',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     hold off
%     
%     fig_num = fig_num + 1;
%     figure(fig_num)
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     set (gca,'Fontsize',15)
%     title(strcat('"Best" - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     % ylim([6.35e3 6.6e3])
%     %     max_tof = max([compilation(p).evolutions.max_tof]);
%     %xlim([0 max_tof])
%     xlabel('Evolution') % x-axis label
%     ylabel('Heading angle (deg)') % y-axis label
%     %set(gca,'YTick', 6.350e3:0.05e3:6.6e3);
%     %set(gca,'XTick', 0:200:max_tof);
%     
%     hold on
%     for ii = 1:3
%         plot(linspace(1,size(best_chi_i,1),size(best_chi_i,1))-1,best_chi_i(:,ii));
%     end
%     legend(legendtext,'Location','southeastoutside')
%     saveas(figure(fig_num),strcat(mainpath,...
%         '/figures/best_heading_per_evolution',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     hold off
%     
%     fig_num = fig_num + 1;
%     figure(fig_num)
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     set (gca,'Fontsize',15)
%     title(strcat('"Best" - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     % ylim([6.35e3 6.6e3])
%     %     max_tof = max([compilation(p).evolutions.max_tof]);
%     %xlim([0 max_tof])
%     xlabel('Evolution') % x-axis label
%     ylabel('Angular distance offset (deg)') % y-axis label
%     %set(gca,'YTick', 6.350e3:0.05e3:6.6e3);
%     %set(gca,'XTick', 0:200:max_tof);
%     hold on
%     for ii = 1:3
%         plot(linspace(1,size(best_dif_d_deg,1),size(best_dif_d_deg,1))-1,best_dif_d_deg(:,ii));
%     end
%     legend(legendtext,'Location','southeastoutside')
%     saveas(figure(fig_num),strcat(mainpath,...
%         '/figures/best_distance_per_evolution',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     hold off
%     
%     fig_num = fig_num + 1;
%     figure(fig_num)
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     set (gca,'Fontsize',15)
%     title(strcat('"Best" - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     % ylim([6.35e3 6.6e3])
%     %     max_tof = max([compilation(p).evolutions.max_tof]);
%     %xlim([0 max_tof])
%     xlabel('Evolution') % x-axis label
%     ylabel('Height offset (m)') % y-axis label
%     %set(gca,'YTick', 6.350e3:0.05e3:6.6e3);
%     %set(gca,'XTick', 0:200:max_tof);
%     hold on
%     for ii = 1:3
%         plot(linspace(1,size(best_dif_h,1),size(best_dif_h,1))-1,best_dif_h(:,ii));
%     end
%     legend(legendtext,'Location','southeastoutside')
%     saveas(figure(fig_num),strcat(mainpath,...
%         '/figures/best_height_per_evolution',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     hold off
%     
%     fig_num = fig_num + 1;
%     figure(fig_num)
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     set (gca,'Fontsize',15)
%     title(strcat('"Best" - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     % ylim([6.35e3 6.6e3])
%     %     max_tof = max([compilation(p).evolutions.max_tof]);
%     %xlim([0 max_tof])
%     xlabel('Evolution') % x-axis label
%     ylabel('Time of flight (s)') % y-axis label
%     %set(gca,'YTick', 6.350e3:0.05e3:6.6e3);
%     %set(gca,'XTick', 0:200:max_tof);
%     hold on
%     for ii = 1:3
%         plot(linspace(1,size(best_tof,1),size(best_tof,1))-1,best_tof(:,ii));
%     end
%     legend(legendtext,'Location','southeastoutside')
%     saveas(figure(fig_num),strcat(mainpath,...
%         '/figures/best_tof_per_evolution',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     hold off
%     
% end
% 
% 
% %% 'Best' Trajectories on 2D Map - Zoom - per Set
% %close all
% for p = 1:numel(compilation)
%     fig_num = p + 2342310;
%     figure(fig_num)
%     hold on
%     title(strcat('"Best" Trajectories - Zoom - per Set ',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     xlabel('\tau (deg)') % x-axis label
%     ylabel('\delta (deg)') % y-axis label
%     img = imread('img.jpg');
%     imagesc([-180 180], [-90 90], (flipud(img)));
%     set (gca,'Fontsize',20)
%     set(gca,'YTick', -90:1:90);
%     set(gca,'XTick', -180:1:180);
%     xlim([(lon_f_deg - 10) (lon_f_deg + 10)])
%     ylim([(lat_f_deg - 5) (lat_f_deg + 5)])
%     
%     if compilation(1).validation == 1
%         xlim([-72 -52])
%         ylim([-3 7])
%         
%     end
%     for k = 1:numel(compilation(p).evolutions)
%         best_index(k,:)   = [compilation(p).evolutions(k).best.index];
%     end
%     
%     
%     for k = 1:numel(compilation(p).evolutions)
%         for ii = 1:size(best_index,2)
%             plot(...
%                 compilation(p).evolutions(k).trajectories(best_index(k,ii)).individual.longitude_angle,...
%                 compilation(p).evolutions(k).trajectories(best_index(k,ii)).individual.latitude_angle,'LineWidth',2)
%             legendtext(k) = cellstr(strcat(strrep(convertCharsToStrings(compilation(p).set),'_',' '),' - Evolution:_{ } ', num2str(k-1)));
%         end
%     end
%     
%     plot(lon_f_deg,lat_f_deg,'MarkerSize',20)
%     plot(lon_f_deg*[1 1],90*[-1 1],'k','LineWidth',2)
%     plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
%     plot(xunit, yunit,'k','LineWidth',2);
%     scatter(lon_f_deg,lat_f_deg,100,'r','x')
%     axP = get(gca,'Position');
%     % legend(legendtext,'Location','southeastoutside')
%     set(gca, 'Position', axP)
%     
%     clear legendtext
%     %xlim([(lon_IAD_deg - 20) (lon_IAD_deg + 20)])
%     %ylim([(lat_IAD_deg - 10) (lat_IAD_deg + 10)])
%     hold off
%     saveas...
%         (figure(fig_num),...
%         strcat(...
%         mainpath,...
%         '/figures/Best_Trajectories_2D_Map_Zoom_Set',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     
% end
% 
% %% 'Best' Trajectories on 2D Map - Zoom - per Set
% %close all
% for p = 1:numel(compilation)
%     fig_num = p + 2342310;
%     figure(fig_num)
%     hold on
%     title(strcat('"Best" Trajectories - Zoom - per Set - To Compare',strrep(convertCharsToStrings(compilation(p).set),'_',' ')))
%     set(figure(fig_num),'units','pixels','position',[0,0,1200,600])
%     xlabel('\tau (deg)') % x-axis label
%     ylabel('\delta (deg)') % y-axis label
%     img = imread('img.jpg');
%     imagesc([-180 180], [-90 90], (flipud(img)));
%     set (gca,'Fontsize',20)
%     set(gca,'YTick', -90:1:90);
%     set(gca,'XTick', -180:1:180);
%     xlim([(lon_f_deg - 10) (lon_f_deg + 10)])
%     ylim([(lat_f_deg - 5) (lat_f_deg + 5)])
%     
%     if compilation(1).validation == 1
%         set(gca,'YTick', -60:20:40);
%         set(gca,'XTick', -140:20:0);
%         ylim([-60 40])
%         xlim([-145 0])
%         
%     end
%     for k = 1:numel(compilation(p).evolutions)
%         best_index(k,:)   = [compilation(p).evolutions(k).best.index];
%     end
%     
%     
%     for k = 1:numel(compilation(p).evolutions)
%         for ii = 1:size(best_index,2)
%             plot(...
%                 compilation(p).evolutions(k).trajectories(best_index(k,ii)).individual.longitude_angle,...
%                 compilation(p).evolutions(k).trajectories(best_index(k,ii)).individual.latitude_angle,'LineWidth',2)
%             legendtext(k) = cellstr(strcat(strrep(convertCharsToStrings(compilation(p).set),'_',' '),' - Evolution:_{ } ', num2str(k-1)));
%         end
%     end
%     
%     plot(lon_f_deg,lat_f_deg,'MarkerSize',20)
%     plot(lon_f_deg*[1 1],90*[-1 1],'k','LineWidth',2)
%     plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
%     plot(xunit, yunit,'k','LineWidth',2);
%     scatter(lon_f_deg,lat_f_deg,100,'r','x')
%     axP = get(gca,'Position');
%     % legend(legendtext,'Location','southeastoutside')
%     set(gca, 'Position', axP)
%     
%     clear legendtext
%     %xlim([(lon_IAD_deg - 20) (lon_IAD_deg + 20)])
%     %ylim([(lat_IAD_deg - 10) (lat_IAD_deg + 10)])
%     hold off
%     saveas...
%         (figure(fig_num),...
%         strcat(...
%         mainpath,...
%         '/figures/Best_Trajectories_2D_Map_Zoom_Set_To_Compare',...
%         convertCharsToStrings(compilation(p).set),...
%         '.png'),...
%         'png');
%     close(fig_num);
%     
% end
% 
% 
% 
% %%
% % for p = 1:numel(compilation)
% %
% % figure(p + 700)
% % set(figure(p + 700),'units','pixels','position',[0,0,1200,600])
% % set (gca,'Fontsize',15)
% % title('Radial Distance through Time - Zoom')
% % %ylim([6.25e6 6.5e6])
% %
% % ylim([6.35e3 6.4e3])
% %
% % xlim([2000 3000])
% % xlabel('Propagation Time (s)') % x-axis label
% % ylabel('Radial Distance (km)') % y-axis label
% % %set(gca,'YTick', 6e6:0.025e6:6.5e6);
% % set(gca,'YTick', 6.35e3:0.0025e3:6.4e3);
% % set(gca,'XTick', 2000:250:3000);
% % hold on
% %
% % for k = 1:numel(compilation(p).evolutions(i).trajectories)
% %     plot(compilation(p).evolutions(i).trajectories(k).individual.t-compilation(p).evolutions(i).trajectories(k).individual.t(1),...
% %         compilation(p).evolutions(i).trajectories(k).individual.R_R_norm/1e3);
% % end
% % plot([0 max_tof],compilation(1).evolutions(1).trajectories(1).individual.R_R_norm(1)*[1 1]/1e3,'k','LineWidth',2)
% %
% % hold off
% %
% % saveas(gcf,strcat(mainpath,'/figures/Radial Distance through Time - Zoom',strrep(convertCharsToStrings(compilation(p).set),'_',' '),'.png'));
% %
% % end
% %%
% 
% 
% for p = 1:numel(compilation)
%     
%     %set(figure(p + 200),'units','pixels','position',[0,0,1200,600])
%     %   xlabel('\tau (deg)') % x-axis label
%     %   ylabel('\delta (deg)') % y-axis label
%     %   imagesc([-180 180], [-90 90], (flipud(img)));
%     % set(gca,'XTick',[], 'YTick', [])
%     %axis('off');
%     %XTickLabel = [];
%     %YTickLabel = [];
%     max_tof = max([compilation(p).evolutions.max_tof]);
%     
%     
%     for ii = 1:numel(compilation(p).evolutions)
%         
%         for k = 1:30:numel(compilation(p).evolutions(ii).trajectories)
%             
%             basenumber = 1000000000 + p*100000000 +ii*10000000 + k*100;
%             
%             basenumber = basenumber+1;
%             figure(basenumber)
%             title('Time History: \chi')
%             set(figure(basenumber),'units','pixels','position',[0,0,1200,600])
%             ylim(360*[-1 1])
%             xlim(max_tof*[0 1])
%             set(gca,'YTick', -360:30:360);
%             set(gca,'XTick', 0:200:max_tof);
%             ylabel('Degrees') % x-axis label
%             xlabel('Time (s)') % y-axis label
%             set (gca,'Fontsize',15)
%             hold on
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.heading_angle));
%             hold off
%             saveas(figure(basenumber),strcat(mainpath,'/figures/heading_v_T_',num2str(ii),'_Set',num2str(k),convertCharsToStrings(compilation(p).set),'.png'));
%             close(basenumber);
%             
%             basenumber = basenumber+1;
%             figure(basenumber)
%             title('Time History: \gamma')
%             set(figure(basenumber),'units','pixels','position',[0,0,1200,600])
%             ylim(45*[-1 1])
%             xlim(max_tof*[0 1])
%             set(gca,'YTick', -45:15:45);
%             set(gca,'XTick', 0:200:max_tof);
%             ylabel('Degrees') % x-axis label
%             xlabel('Time (s)') % y-axis label
%             set (gca,'Fontsize',15)
%             hold on
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.flight_path_angle));
%             hold off
%             saveas(figure(basenumber),strcat(mainpath,'/figures/flightpath_v_T_',num2str(ii),'_Set',num2str(k),convertCharsToStrings(compilation(p).set),'.png'));
%             close(basenumber);
%             
%             basenumber = basenumber+1;
%             figure(basenumber)
%             title('Time History: \alpha')
%             set(figure(basenumber),'units','pixels','position',[0,0,1200,600])
%             ylim(90*[0 1])
%             xlim(max_tof*[0 1])
%             set(gca,'YTick', 0:15:90);
%             set(gca,'XTick', 0:200:max_tof);
%             set (gca,'Fontsize',15)
%             ylabel('Degrees') % x-axis label
%             xlabel('Time (s)') % y-axis label
%             set (gca,'Fontsize',15)
%             hold on
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.angle_of_attack));
%             hold off
%             saveas(figure(basenumber),strcat(mainpath,'/figures/AoA_v_T_',num2str(ii),'_Set',num2str(k),convertCharsToStrings(compilation(p).set),'.png'));
%             close(basenumber);
%             
%             %             basenumber = basenumber+1;
%             %             figure(basenumber)
%             %             title('Time History: \beta')
%             %             set(figure(basenumber),'units','pixels','position',[0,0,1200,600])
%             %             ylim(360*[-1 1])
%             %             xlim(max_tof*[0 1])
%             %             set(gca,'YTick', -90:15:90);
%             %             set(gca,'XTick', 0:200:max_tof);
%             %             set (gca,'Fontsize',15)
%             %             set(figure(basenumber),'units','pixels','position',[0,0,1200,600])
%             %             set (gca,'Fontsize',15)
%             %             hold on
%             %             plot(compilation(p).evolutions(i).trajectories(k).individual.time_vector,(compilation(p).evolutions(i).trajectories(k).individual.angle_of_sideslip));
%             %             hold off
%             %                                                 saveas(figure(basenumber),strcat('/Users/bislip/Cloud Storage/OneDrive/School/TUDelft/Space Flight/Thesis/code/figures/sideslip_v_T_',num2str(i),'_',num2str(k),convertCharsToStrings(compilation(p).set),'.png'));
%             
%             basenumber = basenumber+1;
%             figure(basenumber)
%             title('Time History: \sigma')
%             set(figure(basenumber),'units','pixels','position',[0,0,1200,600])
%             ylim(180*[-1 1])
%             xlim(max_tof*[0 1])
%             set(gca,'YTick', -180:30:180);
%             set(gca,'XTick', 0:200:max_tof);
%             set (gca,'Fontsize',15)
%             hold on
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.bank_angle));
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.heading_angle));
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.heading_required));
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.heading_error));
%             plot(compilation(p).evolutions(ii).trajectories(k).individual.time_vector,(compilation(p).evolutions(ii).trajectories(k).individual.d_deg));
%             
%             plot([0 max_tof],30*[1 1],'k','LineWidth',2)
%             plot([0 max_tof],-30*[1 1],'k','LineWidth',2)
%             plot([0 max_tof],10*[1 1],'k','LineWidth',2)
%             plot([0 max_tof],-10*[1 1],'k','LineWidth',2)
%             plot([0 max_tof],15*[1 1],'r','LineWidth',2)
%             plot([0 max_tof],-15*[1 1],'r','LineWidth',2)
%             plot([0 max_tof],23*[1 1],'r','LineWidth',2)
%             plot([0 max_tof],-23*[1 1],'r','LineWidth',2)
%             plot([0 max_tof],0.75*[1 1],'b','LineWidth',1)
%             %                plot(180*[-1 1],lat_f_deg*[1 1],'k','LineWidth',2)
%             legendtext = [{'\sigma'};{'\chi'};{'\chi_{req}'};{'\chi_{err}'};{'angular distance'};{'Distance b1'};{'Distance b1'};{'Distance b2'};{'Distance b2'};{'\chi_{err} b1'};{'\chi_{err} b1'};{'\chi_{err} b2'};{'\chi_{err} b2'};{'distance termination condition'}];
%             axP = get(gca,'Position');
%             legend(legendtext,'Location','southeastoutside')
%             set(gca, 'Position', axP)
%             ylabel('Degrees') % x-axis label
%             xlabel('Time (s)') % y-axis label
%             hold off
%             saveas(figure(basenumber),strcat(mainpath,'/figures/bank_v_T_',num2str(ii),'_Set',num2str(k),convertCharsToStrings(compilation(p).set),'.png'));
%             close(basenumber);
%             
%             %             basenumber = basenumber+1;
%             %             figure(basenumber)
%             %             title('bank - 3D')
%             %             set(figure(basenumber),'units','pixels','position',[0,0,1200,600])
%             %             set (gca,'Fontsize',15)
%             %             ylabel('Propagation Time (s)') % x-axis label
%             %             xlabel('Angular Distance (deg)') % y-axis label
%             %             zlabel('Heading Angle (deg)') % z-axis label
%             %
%             %             xlim([-180 180])
%             %             ylim([0 max_tof])
%             %             zlim([-180 180])
%             %
%             %             set(gca,'XTick', -180:30:180);
%             %             set(gca,'YTick', 0:500:max_tof);
%             %             set(gca,'zTick', -180:30:180);
%             %
%             %             hold on
%             %             plot3(...
%             %                 compilation(p).evolutions(i).trajectories(k).individual.d_deg,...
%             %                 compilation(p).evolutions(i).trajectories(k).individual.time_vector,...
%             %                 compilation(p).evolutions(i).trajectories(k).individual.bank_angle);
%             %             %  legendtext = ['bank angle';'heading error','angular distance'];
%             %             % legend(legendtext,'Location','southeast')
%             %             view(3)
%             %
%             %
%             %
%             %             hold off
%             
%             
%             
%         end
%     end
%     % view([12,-5])
%     %  ax = gca;               % get the current axis
%     %  ax.Clipping = 'off';
%     %  hold off
%     
% end
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% %%
% 'a'
% % filename = '/Users/bislip/tudatBundle/tudatApplications//Space4Errbody/SimulationOutput/HORUS_OUTPUT/HORUSPropagationHistory.dat';
% 
% %filename = '/Users/bislip/tudatBundle/tudatExampleApplications/satellitePropagatorExamples/SatellitePropagatorExamples/SimulationOutput/ApolloCapsuleExample/apolloPropagationHistory.dat'
% 
% % M = dlmread(filename,',');
% 
% % for i = 1:out
% % t(i) = M(1:end,1);
% % x_I = M(1:end,2);
% % y_I = M(1:end,3);
% % z_I = M(1:end,4);
% % u_I = M(1:end,5);
% % v_I = M(1:end,6);
% % w_I = M(1:end,7);
% %
% % end
% 
% % max_coordinate = max(max(abs(M(1:end,2:4))));
% % n = floor(log(abs(max_coordinate))./log(10));
% % extents = round(max_coordinate,-n);
% % eo = 10^n;
% % R_E = 6.371003216460394e6;
% 
% 
% %%
% % R_I_vect = [x_I y_I z_I];
% % R_I_norm = sqrt(x_I.^2+y_I.^2+z_I.^2);
% % V_I_norm = sqrt(u_I.^2+v_I.^2+w_I.^2);
% % tau_I = atan2(y_I,x_I);
% % delta_I = asin(z_I./R_I_norm);
% % tau_I_deg = tau_I*180/pi;
% % delta_I_deg = delta_I*180/pi;
% 
% 
% 
% %
% % % Calculate Transformation Matrix from Inertial Frame to Rotational Frame
% % omega_E = 7.2921150e-5;
% % del_t = t-t(1);
% % st_RI = [ zeros(numel(t),1) zeros(numel(t),1) (omega_E*del_t) ];
% % C_RI = DCM(st_RI); % 3x3xN
% %
% % % Restructure Inertial Frame position vector to 3x1xN
% % [r,c] = size(R_I_vect);
% % pages = numel(t);
% % R_I_vect   = permute(reshape(R_I_vect',[r/pages,c,pages]),[2,1,3]);
% %
% % % Calculate position vector and related vectors/values in Rotational Frame
% % R_R_vect = mmat(C_RI,R_I_vect,[1 2]);
% % x_R(:,1) = squeeze(R_R_vect(1,1,:));
% % y_R(:,1) = squeeze(R_R_vect(2,1,:));
% % z_R(:,1) = squeeze(R_R_vect(3,1,:));
% % R_R_norm = sqrt(x_R.^2+y_R.^2+z_R.^2);
% 
% % % Calculate latitude and longitude in Rotational Frame
% % tau_R = atan(y_R./x_R); % rad
% % delta_R = asin(z_R./R_R_norm); % rad
% %
% % tau_R_deg = tau_R*180/pi;
% % delta_R_deg = delta_R*180/pi;
% %
% % i = i + 1;
% % figure(i)
% % ax1 = subplot(1,3,1);
% % plot(t,[x_I x_R])
% % title(ax1,'X')
% % ylim(extents*[-1 1])
% % %ylabel(ax1,'Values from -1 to 1')
% % ax2 = subplot(1,3,2);
% % plot(t,[y_I y_R])
% % title(ax2,'Y')
% % ylim(extents*[-1 1])
% % %ylabel(ax2,'Values from 0 to 1')
% % ax3 = subplot(1,3,3);
% % hold on
% % plot(t,[z_I z_R])
% % plot(t,R_E*ones(numel(t),1),'k')
% % plot(t,-R_E*ones(numel(t),1),'k')
% % hold off
% % title(ax3,'Z')
% % ylim(extents*[-1 1])
% %
% %
% % i = i + 1;
% % figure(i)
% % ax1 = subplot(1,2,1);
% % plot([tau_I_deg tau_R_deg])
% % title(ax1,'\tau')
% % ylim(90*[-1 1])
% % %ylabel(ax1,'Values from -1 to 1')
% % ax2 = subplot(1,2,2);
% % plot([delta_I_deg delta_R_deg])
% % title(ax2,'\delta')
% % ylim(180*[-1 1])
% %
% % dist_travel = sqrt((x_I(end)-x_I(1))^2 + (y_I(end)-y_I(1))^2 + (z_I(end)-z_I(1))^2);
% %
% % lat_0 = 52.30805556; %//52deg 18?29"N,
% % lon_0 = 4.76416667; %//4deg 45?51"E.
% % v_0 = 9000; %// m/s
% %
% % x_0 = v_0 * cos(lon_0) * cos(lat_0);
% % y_0 = v_0 * sin(lon_0) * cos(lat_0);
% % z_0 = v_0 * sin(lat_0);
% %
% % %%
% %
% % max_vel = (max(abs(M(1:end,5:7))));
% % max_u = max(abs(M(1:end,5)));
% % max_v = max(abs(M(1:end,6)));
% % max_w = max(abs(M(1:end,7)));
% %
% % i = i + 1;
% % figure(i)
% % hold on
% % plot(t,(u_I))
% % plot(t,(v_I))
% % plot(t,(w_I))
% % hold off
% %
% %
% % i = i + 1;
% % figure(i)
% % hold on
% % plot(t,x_I)
% % plot(t,y_I)
% % plot(t,z_I)
% % hold off
% %
% %
% % p = polyfit(t,R_I_norm,6);
% % a_2 = p(1)*t.^6 + p(2)*t.^5 + p(3)*t.^4 + p(4)*t.^3 + p(5)*t.^2 + p(6)*t.^1 + p(7)*t.^0;
% % %%
% % i = i + 1;
% % figure(i)
% % hold on
% % plot(t,R_I_norm/1000)
% % plot(t,a_2)
% % hold off
% % ylim([min(R_I_norm) 20000000]/1000)
% % set(gcf, 'Position', [0 0 1600 900]);
% % set(gca,'yticklabel',num2str(get(gca,'ytick')','%.1f'))
% % xlabel('time (s)') % x-axis label
% % ylabel('R (km)') % y-axis label
% %
% %
% % %%
% % i = i + 1;
% % figure(i)
% % hold on
% % plot(t,R_I_norm-a_2)
% % plot(t,sqrt((R_I_norm-a_2).^2))
% % hold off
% 
% 
% %%
% %
% % hold on
% % %[S_x, S_y, S_z] = sphere(100);
% % %surf(S_x*r, S_y*r, S_z*r);
% 
% %
% % %  color_line3(x_I2,y_I2,z_I2,t);
% % %scatter3(x_I2(1),y_I2(1),z_I2(1),'filled')
% % %scatter3(x_I2(end),y_I2(end),z_I2(end),'filled')
% %
% %   color_line3(x_R,y_R,z_R,t);
% % scatter3(x_R(1),y_R(1),z_R(1),'filled')
% % scatter3(x_R(end),y_R(end),z_R(end),'filled')
% % view([58,41])
% % %plot3(x,y,z,'LineWidth',5)
% % %quiver3(x(eo:eo:end),y(eo:eo:end),z(eo:eo:end),u(eo:eo:end),v(eo:eo:end),w(eo:eo:end),.75)
% % % plot3(extents*[-1 1],[0 0],[0 0],'k')
% % % plot3([0 0],extents*[-1 1],[0 0],'k')
% % % plot3([0 0],[0 0],extents*[-1 1],'k')
% % % grid on
% % % xlabel('x') % x-axis label
% % % ylabel('y') % y-axis label
% % % zlabel('z') % y-axis label
% % % xlim(extents*[-1 1])
% % % ylim(extents*[-1 1])
% % % zlim(extents*[-1 1])
% % % view(3)
% % % set(gca, 'XDir','reverse')
% % % set(gca, 'YDir','reverse')
% %hold off
end
