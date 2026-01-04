% =============================================================================
% P87 11.3 节 编程练习 第 1 题 (2)
% 【学号为偶数的同学做偶数编号小题】
%
% 题目：试用 MATLAB 命令画出下列系统函数的零极点分布图，并判断其稳定性：
%       (2) H(s) = s(s-2)/(s²+8)
% =============================================================================

% 1(2). 零极点分析
num = [1, -2, 0];  % 分子: s^2 - 2s
den = [1, 0, 8];   % 分母: s^2 + 8

z = roots(num);    % 计算零点
p = roots(den);    % 计算极点

figure;
plot(real(z), imag(z), 'o', 'MarkerSize', 10, 'LineWidth', 2); hold on; % 零点画圈
plot(real(p), imag(p), 'x', 'MarkerSize', 10, 'LineWidth', 2);         % 极点画叉
grid on; axis equal;

% 修饰坐标轴
ax = gca; ax.XAxisLocation = 'origin'; ax.YAxisLocation = 'origin';
xlabel('Real Part (\sigma)'); ylabel('Imaginary Part (j\omega)');
title('H(s) = s(s-2)/(s^2+8) 零极点分布图');
legend('零点 (Zeros)', '极点 (Poles)');

% 稳定性判断输出
fprintf('任务(2) 极点实部为: %f\n', real(p));
disp('判断结论：极点在虚轴上，且无重极点，系统处于临界稳定状态。');