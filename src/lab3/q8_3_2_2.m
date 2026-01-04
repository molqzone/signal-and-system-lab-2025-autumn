% =============================================================================
% P63 8.3 节 编程练习 第 2 题 (2)
% 【全体同学必做】
%
% 题目：已知系统微分方程和激励信号如下，试用 MATLAB 命令求系统的稳态响应：
%       (2) d²y(t)/dt² + 2dy(t)/dt + 3y(t) = -df(t)/dt + 2f(t)
%           f(t) = 3 + cos(2t) + cos(5t)
% =============================================================================

% 1. 定义系统传递函数 H(s) = (-s + 2) / (s^2 + 2s + 3)
num = [-1 2];
den = [1 2 3];

% 2. 定义输入信号的频率成分
omegas = [0, 2, 5]; % 直流, cos(2t), cos(5t)
amps = [3, 1, 1];   % 对应的输入幅度

% 3. 计算每个频率点的响应
H_vals = freqs(num, den, omegas);

% 4. 叠加稳态响应
% y(t) = 3*H(0) + |H(j2)|*cos(2t+phi2) + |H(j5)|*cos(5t+phi5)
y_dc = amps(1) * real(H_vals(1)); % 直流项
y_w2_amp = abs(H_vals(2));
y_w2_phi = angle(H_vals(2));
y_w5_amp = abs(H_vals(3));
y_w5_phi = angle(H_vals(3));

% 输出结果
fprintf('第(2)题稳态响应结果:\n');
fprintf('y_ss(t) = %.4f + %.4f*cos(2t + %.4f) + %.4f*cos(5t + %.4f)\n', ...
    y_dc, y_w2_amp, y_w2_phi, y_w5_amp, y_w5_phi);

% 5. 绘图验证 (可选)
t = 0:0.01:20;
y_t = y_dc + y_w2_amp*cos(2*t + y_w2_phi) + y_w5_amp*cos(5*t + y_w5_phi);
plot(t, y_t, 'LineWidth', 1.5);
title('系统稳态响应曲线 y(t)'); xlabel('时间 t'); ylabel('幅度'); grid on;