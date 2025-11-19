% 定义长方形的四个角坐标
x1 = 1; y1 = 1;  % 左上角
x2 = 40; y2 = 24;  % 右下角

% 生成五个数据点的坐标
corners = [x1, y1; x2, y1; x1, y2; x2, y2; (x1 + x2) / 2, (y1 + y2) / 2];

% 假设每个角点及中心点的z值
zValues = [70.90267 ,63.15423,69.68348,76.51612, 67.00907];  % 示例值

% 创建网格用于插值
[xGrid, yGrid] = meshgrid(linspace(x1, x2, 30), linspace(y1, y2, 30));

% 使用散点插值
zGrid = griddata(corners(:, 1), corners(:, 2), zValues, xGrid, yGrid, 'cubic');

% 绘制热图
figure;
imagesc(linspace(x1, x2, 100), linspace(y1, y2, 100), zGrid);
colorbar;
title('长方形热图');
xlabel('X 轴');
ylabel('Y 轴');
axis xy; % 保持y轴方向
hold on;


hold off;