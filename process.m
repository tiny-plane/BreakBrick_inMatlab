classdef process < handle
    properties
        ini = 0;
        score = 0;
        round = 1;
        totalRound = 1;
        blockList = {};
        blocknum = 0;
        brickLocList = []
        hfigure = gcf;
        axes = gca;
        plate;
        ball;
        constant;
        hblock;
        hball;
        cont = true;
        timecount = 0;
    end
    methods
        function obj = process()
            obj.ball = ball;
            obj.plate = plate;
            obj.constant = constant(obj.plate,obj.ball);
            obj.callRun(obj);
        end
    end
    methods (Static)
        function callRun(o)
            for i = 1:o.totalRound
                o.loadmap(o);
                o.inistate(o);
                o.iniLoc(o);
                o.inidraw(o);
                
                while 1
                    if ~o.cont
                        disp('oh shit!we are going to next round')
                        break
                    end
                    if o.timecount >= 10000
                        disp('...never play again  OK?')
                        break
                    end
                    o.movestep(o);
                    o.collisiondetection(o);
                    o.timecount = o.timecount + 1;
                    pause(o.constant.framestime)
                end
                %       % testdelete
                %       o.deletebrick(o,2)
            end
        end
        function inidraw(o)
            cla
            o.hblock = [];
            axis equal
            axis([0,o.constant.length(1),0,o.constant.length(2)])
            axis manual
            hold on
            grid on
            for i = 1 : o.blocknum
                o.drawnew(i,o)
            end
        end
        function drawnew(i,o)
            switch o.blockList{i}.kind
                case 1%brick
                    switch o.blockList{i}.color
                        case 1%red
                            o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant.bricklength],'FaceColor','r')];
                        case 2%blue
                            o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant.bricklength],'FaceColor','b')];
                        case 3%yellow
                            o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant.bricklength],'FaceColor','y')];
                        case 4%green
                            o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant.bricklength],'FaceColor','g')];
                        otherwise
                            disp('innerERROR')
                    end
                case 2%silver
                    o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant.bricklength],'FaceColor',[0 .5 .5])];
                case 3%golden
                    o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant.bricklength],'FaceColor',[0.2 0.2 0.2])];
                case 5%plate
                    o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant.platelength],'FaceColor',[.5 .5 0])];
                case 10%ball
                    o.hball = plot(o.blockList{i}.loc(1),o.blockList{i}.loc(2),'.','Markersize',40);
                otherwise
                    disp('innerERROR')
            end
            
            
        end
        function movestep(o)
            % x = get(o.hball,'xdata');
            % y =  get(o.hball,'ydata');
            %disp([x,y])
            o.blockList{end}.move(o.blockList{end})
            set(o.hball,'xdata',o.blockList{end}.loc(1),'ydata',o.blockList{end}.loc(2));
            % drawnow
        end
        function collisiondetection(o)
            %wall
            loc = o.blockList{end}.loc;
            if loc(1) <= o.constant.bl
                % o.bloclList{end}.direction = o.bloclList{end}.direction-pi/2;
                o.blockList{end}.velocity(1) = -o.blockList{end}.velocity(1);
                return
            end
            if loc(1) >= o.constant.br
                o.blockList{end}.velocity(1) = -o.blockList{end}.velocity(1);
                return
            end
            if loc(2) >= o.constant.bu
                o.blockList{end}.velocity(2) = -o.blockList{end}.velocity(2);
                return
            end
            if loc(2) <= o.constant.bb
                o.blockList{end}.velocity(2) = -o.blockList{end}.velocity(2);
                return
            end
            %brick
            l1 = o.constant.bricklength(1);
            r = o.constant.ballradius;
            for i = 1 : o.blocknum-2
                temp = (loc-o.blockList{i}.loc);
                if temp * temp'<= o.constant.safedis
                    loc2 = o.blockList{i}.loc;
                    if loc(1) >= loc2(1)-r && loc(1) <= loc2(1) + l1 && loc(2) >= loc2(2)
                        %disp('!')
                       % if loc(1) >= loc2(1)
                        o.deletebrick(o,i);
                        return
                    end
                end
            end
        end
        function iniLoc(o)
            for i = 1:o.blocknum
                o.brickLocList = [o.brickLocList;o.blockList{i}.loc];
            end
        end
        function inistate(o)
            o.timecount = 0;
            bx = o.constant.length(1)/2;
            by = o.constant.platelength(2)+o.constant.ballradius;
            px = bx - o.constant.platelength(1)/2;
            py = 0;
            o.blockList{end}.loc = [bx,by];
            o.blockList{end-1}.loc = [px,py];
        end
        function deletebrick(o,dnum)
            set(o.hblock(dnum),'Visible','off')
            o.blockList(dnum) = [];
            o.brickLocList(dnum,:) = [];
            o.hblock(dnum) = [];
            o.blocknum = o.blocknum - 1;
            %drawnow
        end
        function loadmap(o)
            disp(o.round)
            for i = 1:4
                o.blockList = [o.blockList,{brick([32*i,300])}];
            end
            for i = 1:4
                o.blockList = [o.blockList,{brick([32*i,250])}];
            end
            for i = 1:4
                o.blockList = [o.blockList,{brick([32*i,200])}];
            end
            o.blockList = [o.blockList,{o.plate},{o.ball}];
            o.blocknum = size(o.blockList,2);
        end
    end
end