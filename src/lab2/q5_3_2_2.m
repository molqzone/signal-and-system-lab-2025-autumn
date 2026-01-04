% =============================================================================
% P38 5.3 节 编程练习 第 2 题 (2)
% 【全体同学必做】
%
% 题目：已知系统的微分方程如下，试用 MATLAB 命令求系统冲激响应
%       和阶跃响应的数值解，并绘出系统冲激响应和阶跃响应的时域波形图：
%       (2) y''(t) + 2y'(t) + 2y(t) = f'(t)
% =============================================================================

num = [1 0];
den = [1 2 2];
sys = tf(num, den);

t = 0:0.01:8;

figure(2);
subplot(2, 1, 1);
impulse(sys, t);
title('impulse response h(t)');
grid on;

subplot(2, 1, 2);
impulse(sys, t);
title('step response g(t)');
grid on;

[h, t_h] = impulse(sys, t);
[g, t_g] = step(sys, t);

disp('impulse response head 5');
disp(h(1:5));
disp('state response head 5');
disp(g(1:5));