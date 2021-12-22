
angles = linspace(0,2*pi,65);
angles(end) = [];

xCeil = zeros(size(angles));
yCeil = zeros(size(angles));

xAway = zeros(size(angles));
yAway = zeros(size(angles));

xTrue = zeros(size(angles));
yTrue = zeros(size(angles));

colorArr = ones(numel(angles),1)*0.5;
colorCeil = zeros(numel(angles),3);
colorAway = zeros(numel(angles),3);

for n = 1:numel(angles)
    xTrue(n) = -1*cos(angles(n));
    yTrue(n) = sin(angles(n));
    
    xCeil(n) = ceil(cos(angles(n)));
    yCeil(n) = ceil(sin(angles(n)));
    
    xAway(n) = round(cos(angles(n)));
    yAway(n) = round(sin(angles(n)));
end

colorCeil(:,1) = .5*(1+xCeil');
colorCeil(:,2) = .5*(1+yCeil');
colorAway(:,1) = .5*(1+xAway');
colorAway(:,2) = .5*(1+yAway');

figure
subplot(1,2,1)
for x = 0:.5:1
    for y = 0:.5:1
        plotIdx = colorCeil(:,1) == x & colorCeil(:,2) == y;
        scatter(xTrue(plotIdx),yTrue(plotIdx),'filled')
        hold on
    end
end
subplot(1,2,2)
for x = 0:.5:1
    for y = 0:.5:1
        plotIdx = colorAway(:,1) == x & colorAway(:,2) == y;
        scatter(xTrue(plotIdx),yTrue(plotIdx),'filled')
        hold on
    end
end

% figure
% subplot(1,2,1)
% scatter(xTrue,yTrue,[],colorCeil,'filled')
% subplot(1,2,2)
% scatter(xTrue,yTrue,[],colorAway,'filled')