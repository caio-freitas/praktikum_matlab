function animierePendel(vT, mX, stPendel, hAxes, makeAvi)
	l1 = stPendel.l1;
	l2 = stPendel.l2;
    
    pause = 0.1;
    vTAnim = 0:pause:vT(end);
    
    phi1 = mX(:,1);
	phi2 = mX(:,3);
    
    phi1Interp = interp1(vT, phi1,vTAnim);
    phi2Interp = interp1(vT,phi2,vTAnim);
    
    x1   = l1*sin(phi1Interp);
    y1   = -l1*cos(phi1Interp);
    x2   = l1*sin(phi1Interp) + l2*sin(phi2Interp);
    y2   = -l1*cos(phi1Interp) + -l2*cos(phi2Interp);
    
    p1 = @(i) plot([0 x1(i)],[0 y1(i)],'b-');
    p2 = @(i) plot([x1(i) x2(i)],[y1(i) y2(i)],'r-');
    
    indexes=[1,size(vTAnim,2)];

    figure
    axis(hAxes)
    hold on;
    fanimator(p1,'AnimationRange',indexes,'FrameRate',1);
    fanimator(p2,'AnimationRange',indexes,'FrameRate',1);
    fanimator(@(t) text(-0.1,0.3,"Timer: "+num2str(vTAnim(t),2)+" s"),'AnimationRange',indexes,'FrameRate',1);
    
     if exist('makeAvi','var')
        if (makeAvi)
         writeAnimation('doppelPendel.avi', 'FrameRate',10);
        end
    end 
