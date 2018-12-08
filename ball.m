classdef ball <  handle
    properties
        kind = 1;
        loc = [100,100];
        hit = 0;
        life = 1;
        render = 0;
        length = [30,10];
        direction = pi/2;
        velocity = 2;
        ini = 0;
        radius = 5;
    end
    methods
        function obj = ball()
            obj.kind = 10;
        end
    end
    methods (Static)
        function changeDirection(ball,brick)
            
        end
        function move(ball)
            if ini == 1
                ball.loc = ball.loc + ball.velocity.*[cos(ball.direction),sin(ball.direction)];
            end
        end
        function Hitjudge(ball,brickList,map)
            
        end
    end
end
            
        