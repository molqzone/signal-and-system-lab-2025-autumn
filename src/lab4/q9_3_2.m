% =============================================================================
% P71 9.3 节 编程练习 第 2 题
% 【学号为偶数的同学做第 2 题】
%
% 题目：结合抽样定理，用 MATLAB 编程实现 Sa(t) 信号经冲激脉冲抽样后得到的
%       抽样信号 f_s(t) 及其频谱，并利用 f_s(t) 重构 Sa(t) 信号。
% =============================================================================

clear; clc; close all;

% --- 1. 参数设置 ---
t = -20:0.01:20;              % 连续时间轴（模拟）
f_t = sinc(t/pi);             % 原始信号 Sa(t)，注意 MATLAB 中 sinc(x) = sin(pi*x)/(pi*x)

Ts = 1.5;                     % 抽样间隔 (满足 fs > 2fc)
n = -20:Ts:20;                % 抽样时刻
f_n = sinc(n/pi);             % 抽样后的序列

% --- 2. 信号重构 (利用插值公式) ---
% y(t) = sum[ f(nTs) * sinc((t-nTs)/Ts) ]
f_recovery = zeros(size(t));
for i = 1:length(n)
    f_recovery = f_recovery + f_n(i) * sinc((t - n(i))/Ts);
end

% --- 3. 频谱分析 (FFT) ---
fs_analog = 100;              % 模拟采样频率
F_analog = fftshift(fft(f_t)) / length(t);
freq = linspace(-fs_analog/2, fs_analog/2, length(t));

% --- 4. 绘图展示 ---
figure('Color', 'w', 'Name', 'Sa(t) 抽样与重构仿真');

% 时域对比
subplot(2,1,1);
plot(t, f_t, 'b', 'LineWidth', 1.5); hold on;
stem(n, f_n, 'r', 'filled', 'LineWidth', 1);
plot(t, f_recovery, 'g--', 'LineWidth', 1.5);
legend('原始信号 Sa(t)', '脉冲抽样信号 f_s(t)', '重构信号');
title('时域信号抽样与重构'); xlabel('时间 t'); grid on;

% 频域展示
subplot(2,1,2);
plot(freq, abs(F_analog), 'LineWidth', 1.5);
title('Sa(t) 信号频谱'); xlabel('频率 f (Hz)'); ylabel('幅度');
axis([-1 1 0 max(abs(F_analog))*1.2]); grid on;