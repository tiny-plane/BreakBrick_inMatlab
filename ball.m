classdef ball < block & handle
    properties
        direction = pi/2;
        velocity = 2;
        ini = 0;
        radius = 5;
    end
    methods
        function obj = ball()
            obj.kind = 5;
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
            
        