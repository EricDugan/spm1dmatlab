


X = NMG_03739_P_DB_V1_BF.Kinematic.Normalized.LKNEE_ANGLE.X.Strides;
Y = SLOW1_Knee_Angle_X(:,2:end);

X = X';
Y = Y';



spm = spm1d.stats.ttest2(X,Y);
spmi = spm.inference(0.05,'two_tailed',true);
disp(spmi)

spm1d.plot.plot_meanSD(X,'color','r');
hold on
spm1d.plot.plot_meanSD(Y,'color','b');

figure
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();


X = raw1.Kinematic.Normalized.LKNEE_ANGLE.X.Strides';
Y = raw2.Kinematic.Normalized.LKNEE_ANGLE.X.Strides';

