% 定义长方形的四个角坐标
x1 = 1; y1 = 1;  % 左上角
x2 = 40; y2 = 24;  % 右下角

% 生成五个数据点的坐标
corners = [x1, y1; x2, y1; x1, y2; x2, y2; (x1 + x2) / 2, (y1 + y2) / 2];

% 假设每个角点及中心点的z值
zValues = [0.0719,0.0841,0.0998,0.0583,0.0052];  % 示例值

% 创建网格用于插值
[xGrid, yGrid] = meshgrid(linspace(x1, x2, 30), linspace(y1, y2, 30));

% 使用散点插值
zGrid = griddata(corners(:, 1), corners(:, 2), zValues, xGrid, yGrid, 'cubic');

% 绘制热图
figure;
figure('Position', [100, 100, 1000, 600]);
imagesc(linspace(x1, x2, 100), linspace(y1, y2, 100), zGrid);
colorbar;
colormap turbo;  % 使用 turbo 色图
axis xy; % 保持y轴方向
ax = gca;
set(ax, 'FontName', 'Times New Roman', 'FontSize', 26, 'FontWeight', 'bold');
xTicks = [4:4:40];  % 创建从4到40，步长为4的向量
set(gca, 'XTick', xTicks);
yTicks = [4:4:20];  % 创建从4到20，步长为4的向量
set(gca, 'YTick', yTicks);

hold on;


hold off;