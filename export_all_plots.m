% MATLAB 自动化脚本：批量导出所有图形
% 按 lab 和题目分类保存

function export_all_plots()
    clear; clc;
    close all;

    % 设置根目录
    root_dir = fileparts(mfilename('fullpath'));

    % 创建输出目录
    output_dir = fullfile(root_dir, 'figures');
    if ~exist(output_dir, 'dir')
        mkdir(output_dir);
    end

    % 支持的图像格式
    export_format = 'png';  % 可选: 'png', 'eps', 'pdf', 'svg'

    % 递归获取所有 .m 文件（兼容旧版MATLAB）
    src_dir = fullfile(root_dir, 'src');
    fprintf('扫描目录: %s\n', src_dir);

    if ~exist(src_dir, 'dir')
        fprintf('错误: src 目录不存在！\n');
        return;
    end

    m_files_list = {};  % 使用cell数组存储，避免动态扩展
    lab_dirs = dir(src_dir);

    fprintf('找到 %d 个子目录\n', length(lab_dirs));

    for i = 1:length(lab_dirs)
        if ~lab_dirs(i).isdir || startsWith(lab_dirs(i).name, '.')
            continue;
        end

        lab_path = fullfile(src_dir, lab_dirs(i).name);
        files = dir(fullfile(lab_path, '*.m'));

        fprintf('  %s: %d 个文件\n', lab_dirs(i).name, length(files));

        for j = 1:length(files)
            files(j).folder = lab_path;
            m_files_list{end+1} = files(j);
        end
    end

    % 转换为struct数组
    if ~isempty(m_files_list)
        m_files = [m_files_list{:}];
    else
        m_files = [];
    end

    % 计数器
    total_plots = 0;
    total_files = 0;

    fprintf('=== 开始批量导出图形 ===\n');
    fprintf('找到 %d 个 .m 文件\n\n', length(m_files));

    % 检查是否找到文件
    if isempty(m_files)
        fprintf('错误: 未找到任何 .m 文件！\n');
        fprintf('请检查 src 目录是否存在且包含 .m 文件。\n');
        return;
    end

    % 遍历所有文件
    for i = 1:length(m_files)
        file_path = fullfile(m_files(i).folder, m_files(i).name);

        % 读取文件内容，检查是否包含绘图命令
        fid = fopen(file_path, 'r');
        if fid == -1
            continue;
        end

        file_content = fread(fid, '*char')';
        fclose(fid);

        % 检查是否包含绘图相关命令
        plot_commands = {'plot', 'stem', 'figure', 'subplot', 'bar', ...
                         'surf', 'mesh', 'contour', 'imagesc'};

        has_plot = false;
        for j = 1:length(plot_commands)
            if contains(file_content, plot_commands{j})
                has_plot = true;
                break;
            end
        end

        if ~has_plot
            continue;
        end

        % 提取 lab 和题目信息
        % 文件路径格式: src\labX\qY_... 或 src/labX/qY_...
        path_parts = strsplit(file_path, filesep);

        lab_name = '';
        q_name = '';

        for k = 1:length(path_parts)
            if startsWith(lower(path_parts{k}), 'lab')
                lab_name = path_parts{k};
            elseif startsWith(lower(path_parts{k}), 'q')
                q_name = path_parts{k};
                % 移除 .m 扩展名
                q_name = strrep(q_name, '.m', '');
            end
        end

        if isempty(lab_name) || isempty(q_name)
            fprintf('跳过: %s (无法解析lab/题目)\n', m_files(i).name);
            continue;
        end

        % 创建输出子目录
        lab_output_dir = fullfile(output_dir, lab_name);
        if ~exist(lab_output_dir, 'dir')
            mkdir(lab_output_dir);
        end

        % 运行脚本前保存当前图形窗口
        figs_before = findall(0, 'Type', 'figure');

        % 运行脚本
        try
            fprintf('运行: %s ... ', m_files(i).name);

            % 读取并修改脚本，移除 clear 和 clc 命令
            fid = fopen(file_path, 'r');
            script_text = fread(fid, '*char')';
            fclose(fid);

            % 移除 clear 和 clc 命令（避免清除主脚本变量）
            script_text = regexprep(script_text, '^\s*clear\s*;?\s*', '', 'lineanchors');
            script_text = regexprep(script_text, '^\s*clc\s*;?\s*', '', 'lineanchors');

            % 创建临时脚本文件
            temp_script_path = fullfile(root_dir, ['temp_script_' num2str(i) '.m']);
            fid = fopen(temp_script_path, 'w');
            fprintf(fid, '%s', script_text);
            fclose(fid);

            % 运行临时脚本
            run(temp_script_path);

            % 删除临时脚本
            delete(temp_script_path);

            % 等待图形渲染完成
            pause(0.5);

            % 获取新创建的图形窗口
            figs_after = findall(0, 'Type', 'figure');
            new_figs = setdiff(figs_after, figs_before);

            if ~isempty(new_figs)
                % 导出每个新图形
                for fig_idx = 1:length(new_figs)
                    fig_handle = new_figs(fig_idx);

                    % 设置图形为当前图形
                    figure(fig_handle);

                    % 生成文件名
                    if length(new_figs) == 1
                        img_filename = sprintf('%s.%s', q_name, export_format);
                    else
                        img_filename = sprintf('%s_%d.%s', q_name, fig_idx, export_format);
                    end

                    img_path = fullfile(lab_output_dir, img_filename);

                    % 导出图形
                    print(fig_handle, img_path, ['-d' export_format], '-r300');

                    fprintf('导出: %s\n', img_filename);
                    total_plots = total_plots + 1;
                end

                % 关闭所有新创建的图形窗口
                close(new_figs);
            else
                fprintf('未检测到新图形\n');
            end

            total_files = total_files + 1;

        catch ME
            fprintf('错误: %s\n', ME.message);
            % 确保关闭所有图形，即使出错
            close all;
        end

        % 清理工作空间
        close all;
    end

    fprintf('\n=== 导出完成 ===\n');
    fprintf('处理文件数: %d\n', total_files);
    fprintf('导出图形数: %d\n', total_plots);
    fprintf('输出目录: %s\n', output_dir);
end
