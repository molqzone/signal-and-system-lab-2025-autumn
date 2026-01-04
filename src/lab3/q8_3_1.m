% =============================================================================
% P63 8.3 节 编程练习 第 1 题
% 【全体同学必做】
%
% 题目：试用 MATLAB 命令求图 8-8 所示电路系统的幅频特性和相频特性。
%       已知 R = 10Ω, L = 2H, C = 0.1F。
% =============================================================================

% 定义电路参数
R = 10; L = 2; C = 0.1;

% 建立传递函数 H(s) = num / den
% 分子系数: [0 0 R]
% 分母系数: [L*R*C, L, R]
num = R;
den = [L*R*C, L, R];

sys = tf(num, den);

% 绘制幅频和相频特性 (Bode图)
figure;
bode(sys);
grid on;
title('图 8-8 电路系统的幅频和相频特性 (Bode Plot)');

% 或者使用 freqs 绘制线性坐标下的频率响应
[h, w] = freqs(num, den, 100);
figure;
subplot(2,1,1); plot(w, abs(h), 'LineWidth', 1.5); grid on;
title('幅频特性 |H(j\omega)|'); xlabel('\omega (rad/s)'); ylabel('增益');

subplot(2,1,2); plot(w, angle(h)*180/pi, 'LineWidth', 1.5); grid on;
title('相频特性 \phi(\omega)'); xlabel('\omega (rad/s)'); ylabel('相位 (degrees)');