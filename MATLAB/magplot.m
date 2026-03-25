% figure(2)
% plot3([min_mx_cal,max_mx_cal],[0,0],[0,0],'r-','LineWidth',2);
% hold on
% plot3([0,0],[min_my_cal,max_my_cal],[0,0],'r-','LineWidth',2);
% plot3([0,0],[0,0],[min_mz_cal,max_mz_cal],'r-','LineWidth',2);
% sh1 = scatter3(mx_cal,my_cal,mz_cal,'b.');
% ah = gca;
% title('Calibrated Magnetometer Data');
% xlabel('X Magnetic Flux (mG)');
% ylabel('Y Magnetic Flux (mG)');
% zlabel('Z Magnetic Flux (mG)');
% set(ah,'FontSize',12);
% set(ah,'TitleFontSizeMultiplier',1.2);
% set(ah,'LineWidth',1);
% axis equal
% grid on

clf
figure(3)
scatter(mx, my, 2)
hold on
scatter(mx_cal, my_cal, 2)
axis equal
xlabel('X Magnetic Flux (mG)');
ylabel('Y Magnetic Flux (mG)');
title("Uncalibrated and Calibrated XY Magnetic Induction")
legend("Uncalibrated", "Calibrated")