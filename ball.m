classdef ball <  handle
    properties
        kind = 1;
        loc = [100,100];
        hit = 0;
        life = 1;
        render = 0;
        length = [30,10];
        inidirection = pi/4;
        velocity = []; %per frame
        ini = 0;
        radius = 5;
    end
    methods
        function obj = ball()
            obj.kind = 10;
            obj.velocity = 5*[cos(obj.inidirection),sin(obj.inidirection)];
        end
    end
    methods (Static)
        function changeDirection(ball,brick)
            
        end
        function move(ball)
                ball.loc = ball.loc + ball.velocity;
        end
        function Hitjudge(ball,brickList,map)
            
        end
    end
end
            
        