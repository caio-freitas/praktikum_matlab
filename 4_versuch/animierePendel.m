function animierePendel(vT, mX, stPendel, appAx, hAxes, video,app)
	l1 = stPendel.l1;
	l2 = stPendel.l2;
    
    interval = 0.1;
    vTAnim = 0:interval:vT(end);
    
    phi1 = mX(:,1);
	phi2 = mX(:,3);
    
    phi1Interp = interp1(vT, phi1,vTAnim);
    phi2Interp = interp1(vT,phi2,vTAnim);
    
    x1   = l1*sin(phi1Interp);
    y1   = -l1*cos(phi1Interp);
    x2   = x1 + l2*sin(phi2Interp);
    y2   = y1 + -l2*cos(phi2Interp);
    
    p1 = @(i) plot([0 x1(i)],[0 y1(i)],'b-', linewidth=4);
    p2 = @(i) plot([x1(i) x2(i)],[y1(i) y2(i)],'r-', linewidth=4);
    
    indexes=[1,size(vTAnim,2)];

    if isempty(hAxes)
        hAxes = [-.5 .5 -.5 .5]; % default value
    end

    axis(appAx,hAxes)
    hold(appAx,'on')
    title(appAx,'Simulation')
    
    if (not(video))
        for i=indexes(1):indexes(2)
            cla(appAx);
            text(appAx,-0.1,0.3,"t = "+num2str(vTAnim(i),2)+" s");
            plot(appAx,[0 x1(i)],[0 y1(i)],'b-', linewidth=4);
            plot(appAx,[x1(i) x2(i)],[y1(i) y2(i)],'r-', linewidth=4);
            if (app.StopAnimation)
                break;
            end
            pause(0.05)
        end
        
    else
        fanimator(appAx,p1,'AnimationRange',indexes,'FrameRate',1);
        fanimator(appAx,p2,'AnimationRange',indexes,'FrameRate',1);
        fanimator(appAx,@(t) text(-0.1,0.3,"t = "+num2str(vTAnim(t),2)+" s"),'AnimationRange',indexes,'FrameRate',1);
        playAnimation(appAx.Parent)

        if exist('video','var')
            if (video)
            writeAnimation('doppelPendel.avi', 'FrameRate',10);
            end
        end
    end
