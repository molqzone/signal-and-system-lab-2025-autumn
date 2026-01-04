% =============================================================================
% P32 4.3 节 编程练习 第 1 题
% 【全体同学必做】
%
% 题目：利用 MATLAB 命令计算并绘出下列两个信号的卷积结果的波形图
% =============================================================================

dt = 0.01;
t = -1:dt:5;

f1 = zeros(size(t));
f1((t >= 0) & (t < 2)) = 1;

f2 = zeros(size(t));
f2((t >= 0) & (t < 1)) = 1;
f2((t >= 1) & (t < 2)) = 2;
f2((t >= 2) & (t < 3)) = 1;

f_conv = conv(f1, f2, 'full') * dt;

t_conv = linspace(2 * t(1), 2 * t(end), length(f_conv));

figure;
subplot(3, 1, 1);
plot(t, f1, 'LineWidth', 1.5);
title('f_1(t)');
xlabel('t'); ylabel('Amplitude');
xlim([-1, 5]); grid on;
subplot(3, 1, 2);

plot(t, f2, 'LineWidth', 1.5);
title('f_2(t)');
xlabel('t'); ylabel('Amplitude');
xlim([-1, 5]); grid on;
subplot(3, 1, 3);

plot(t_conv, f_conv, 'LineWidth', 1.5);
title('f_1(t) * f_2(t)');
xlabel('t'); ylabel('Amplitude');
xlim([-1, 8]); grid on;
