% =============================================================================
% P45 6.3 节 编程练习 第 2 题
% 【学号为偶数的同学做第 2 题】
%
% 题目：试用 MATLAB 分析图 6-5 中周期三角信号的频谱。
%       当周期三角信号的周期和三角信号的宽度变化时，试观察分析其频谱的变化。
% =============================================================================

clear; clc;

% 定义参数
T_list = [2, 4];      % 不同的周期
width_list = [1, 0.5]; % 不同的三角波底宽 (tau)

figure('Name', '周期三角信号频谱分析');

for i = 1:2
    T = T_list(i);
    tau = width_list(i);
    fs = 100;           % 采样频率
    t = -3*T : 1/fs : 3*T; % 时间范围

    % 1. 生成周期三角信号
    % sawtooth(x, 0.5) 生成对称三角波
    xt = 0.5 * (sawtooth(2 * pi / T * (t + tau/2), 0.5) + 1);
    % 修正宽度：只保留宽度为 tau 的部分，其余置零（针对本题图形特点）
    xt(mod(t + tau/2, T) > tau) = 0;

    % 2. 计算频谱 (使用 FFT 模拟连续谱的抽样)
    L = length(t);
    Xf = abs(fftshift(fft(xt))) / L;
    f = (-L/2 : L/2-1) * (fs / L);

    % 3. 绘图
    subplot(2, 2, 2*i-1);
    plot(t, xt, 'LineWidth', 1.5);
    title(['时域信号 (T=', num2str(T), ', \tau=', num2str(tau), ')']);
    grid on; axis([-5 5 -0.2 1.2]);

    subplot(2, 2, 2*i);
    stem(f, Xf, 'Marker', 'none');
    title('幅度谱 (离散谱线)');
    xlabel('频率 (Hz)');
    ylabel('|c_n|');
    grid on; axis([-5 5 0 0.6]);
end
