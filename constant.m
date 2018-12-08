classdef constant < handle
    properties
        length = [200,400];
        bricklength = [];
        platelength = [];
        ballradius = [];
        end
    methods
        function obj = map(plate,ball)
            temp = block();
            obj.bricklength = temp.length;
            obj.platelength = plate.length;
            obj.ballradius = ball.radius;
        end
    end
end