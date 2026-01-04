% =============================================================================
% P87 11.3 节 编程练习 第 1 题 (4)
% 【学号为偶数的同学做偶数编号小题】
%
% 题目：试用 MATLAB 命令画出下列系统函数的零极点分布图，并判断其稳定性：
%       (4) H(s) = s²/(s²-4s+8)
% =============================================================================

% 1(4). 零极点分析
num = [1, 0, 0];   % 分子: s^2
den = [1, -4, 8];  % 分母: s^2 - 4s + 8

z = roots(num);    % 计算零点
p = roots(den);    % 计算极点

figure;
plot(real(z), imag(z), 'o', 'MarkerSize', 10, 'LineWidth', 2); hold on;
plot(real(p), imag(p), 'x', 'MarkerSize', 10, 'LineWidth', 2);
grid on; axis equal;

% 修饰坐标轴
ax = gca; ax.XAxisLocation = 'origin'; ax.YAxisLocation = 'origin';
xlabel('Real Part (\sigma)'); ylabel('Imaginary Part (j\omega)');
title('H(s) = s^2/(s^2-4s+8) 零极点分布图');
legend('零点 (Zeros)', '极点 (Poles)');

% 稳定性判断输出
fprintf('任务(4) 极点实部为: %f\n', real(p));
disp('判断结论：极点位于右半平面（实部 > 0），系统不稳定。');