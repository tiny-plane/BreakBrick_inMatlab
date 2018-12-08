classdef process < handle
    properties
        ini = 0;
        score = 0;
        round = 1;
        totalRound = 2;
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
    end
    methods
        function obj = process()
            obj.callRun(obj);
            obj.ball = ball;
            obj.plate = plate;
            obj.constant = constant(obj.plate,obj.ball);
        end
    end
    methods (Static)
        function callRun(o)
            inidraw(o);
            
        end
        function inidraw(o)
            o.hblock = [];
            for i = 1 : o.bricknum
                drawnew(i,o)
            end
        end
        function drawnew(i,o)
            switch o.blockList{i}.kind
                case 1
                    o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant{i}.length],'FaceColor',[0 .5 .5])];
                case 5
                    o.hblock = [o.hblock,rectangle('Position',[o.blockList{i}.loc,o.constant{i}.length],'FaceColor',[.5 .5 0])];
                case 10
                    o.hball = plot([o.blockList{i}.loc],'o','Markersize',20);
                otherwise
                    disp('innerERROR')
            end
            
            
        end
        
    end
end