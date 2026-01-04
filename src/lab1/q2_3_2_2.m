% =============================================================================
% P12 2.3 节 编程练习 第 2 题 (2)
% 【全体同学必做】
%
% 题目：利用 MATLAB 命令画出下列复信号的实部、虚部、模和辐角：
%       (2) f(t) = 2e^(j(t + π/4))
% =============================================================================
t = 0:0.01:10; % 定义时间范围
f = 2 * exp(1j * (t + pi/4)); % 定义复信号

figure('Name', '信号 2 的分解图');

% 绘制实部
subplot(2, 2, 1);
plot(t, real(f), 'b', 'LineWidth', 1.5);
title('实部 Real Part'); grid on; xlabel('t');

% 绘制虚部
subplot(2, 2, 2);
plot(t, imag(f), 'r', 'LineWidth', 1.5);
title('虚部 Imaginary Part'); grid on; xlabel('t');

% 绘制模
subplot(2, 2, 3);
plot(t, abs(f), 'g', 'LineWidth', 1.5);
ylim([0 3]); % 模为常数 2，固定坐标轴以便观察
title('模 Magnitude'); grid on; xlabel('t');

% 绘制幅角
subplot(2, 2, 4);
plot(t, angle(f), 'm', 'LineWidth', 1.5);
title('幅角 Phase Angle'); grid on; xlabel('t');