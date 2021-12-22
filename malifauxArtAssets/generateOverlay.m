%import all numbers
basePath = 'C:\Users\Andoroth\Downloads\malifauxArtAssets';
s = struct('cdata',zeros(25,25,3),'alpha',zeros(25,25));
for n = 0:9
    [cdata, ~, alpha] = imread([basePath '\Overlay_' num2str(n) '.png']);
    s(n+1) = struct('cdata',cdata,'alpha',alpha);
end

% get their individual widths
digitWidth = 1:10;
digitStart = 1:10;
for n = 1:10
    pxMax = max(s(n).cdata(:,:,1));
    first = find(pxMax,1);
    last = find(pxMax,1,'last');
    digitWidth(n) = (last-first)+1;
    digitStart(n) = first;
end

% generate an array of the number of pixels to kern between each digit pair
baseKerningDistance = [0,0,0,0,-1,0,-1,-1,0,0];

% for each pair, calculate the total width, center it, then place each digit onto the 25x25 template
for n = 1:5
    tensWidth = digitWidth(n+1);
    tensStart = digitStart(n+1);
    if n ~= 4
        kerningDistance = baseKerningDistance;
    else
        kerningDistance = baseKerningDistance-1;
    end
    for m = 0:9
        baseImage = zeros(25,25,'uint8');
        baseAlpha = zeros(25,25,'uint8');
        
        onesWidth = digitWidth(n+1);
        onesStart = digitStart(n+1);
        pairWidth = tensWidth+onesWidth+kerningDistance(m+1);
        startIdx = 13-round(pairWidth/2)-round(kerningDistance(m+1)/2);
        firstEndIdx = startIdx+tensWidth-1;
        secondStartIdx = firstEndIdx+kerningDistance(m+1)+1;
        secondEndIdx = secondStartIdx+onesWidth-1;
        
        aExt = 1;
        
        baseImage(:,startIdx:firstEndIdx) = s(n+1).cdata(:,tensStart:(tensStart+tensWidth-1),1);
        baseAlpha(:,1:firstEndIdx+aExt) = s(n+1).alpha(:,(tensStart+tensWidth)-firstEndIdx:(tensStart+tensWidth-1)+aExt,1);
        
        onesIm = max(cat(3,baseImage(:,secondStartIdx:secondEndIdx),s(m+1).cdata(:,onesStart:(onesStart+onesWidth-1),1)),[],3);
        onesAlpha = max(cat(3,baseAlpha(:,secondStartIdx-aExt:25),s(m+1).alpha(:,onesStart-aExt:(onesStart+(25-secondStartIdx)),1)),[],3);
        
        
        baseImage(:,secondStartIdx:secondEndIdx) = onesIm;
        baseAlpha(:,secondStartIdx-aExt:25) = onesAlpha;
        %         imshow(255*ones(25,25,'uint8'));
        %         hold on
        %         h = imshow(baseImage,'Border','tight');
        %         set(h,'AlphaData', baseAlpha);
        %         hold off
        
        imwrite(repmat(baseImage,1,1,3),[basePath '\newOverlay\Overlay_' num2str(n) num2str(m) '.png'],'Alpha',baseAlpha);
    end
end