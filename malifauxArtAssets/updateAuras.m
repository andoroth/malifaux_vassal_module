
mkdir('updatedImages');
stemArray = {'30mmAuras-','40mmAuras-','50mmAuras-'};
sizeArray = [35,47,59];

for f = 1:3
fileStem = stemArray{f};
sz = sizeArray(f);

for n = 1:20
    fName = sprintf('%s%d.png',fileStem,n);
    [im,~,alpha] = imread(fName);
    
    nPixels = sz+30*2*n;
    xStartTarget = 650-(n*30+(sz-1)/2);
    yStartTarget = 651-(n*30+(sz-1)/2);
    
    xMax = max(alpha(:,:)>0,[],1);
    xStartIdx = find(xMax,1,'first');
    xEndIdx = find(xMax,1,'last');
    
    yMax = max(alpha(:,:)>0,[],2);
    yStartIdx = find(yMax,1,'first');
    
    if (1+xEndIdx-xStartIdx)>nPixels
        im(651:end-1,:,:) = im(652:end,:,:);
        alpha(651:end-1,:) = alpha(652:end,:);
        im(:,651:end-1,:) = im(:,652:end,:); 
        alpha(:,651:end-1) = alpha(:,652:end);
    end
    if xStartIdx>xStartTarget
        im(:,1:end-1,:) = im(:,2:end,:); 
        alpha(:,1:end-1) = alpha(:,2:end);
    end
    if yStartIdx>yStartTarget
        im(1:end-1,:,:) = im(2:end,:,:); 
        alpha(1:end-1,:) = alpha(2:end,:);
    elseif yStartIdx<yStartTarget
        im(2:end,:,:) = im(1:end-1,:,:); 
        alpha(2:end,:) = alpha(1:end-1,:);
    end
    
    imwrite(im,sprintf('updatedImages/%s%de.png',fileStem,n),'Alpha',alpha);
end
end