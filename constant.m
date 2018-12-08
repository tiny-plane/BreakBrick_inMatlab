classdef constant < handle
    properties
        length = [200,400];
        bricklength = [];
        platelength = [];
        ballradius = [];
        framestime = 0.05;
        bl;
        br;
        bu;
        bb;
        safedis;
        end
    methods
        function obj = constant(plate,ball)
            temp = block();
            obj.bricklength = temp.length;
            obj.platelength = plate.length;
            obj.ballradius = ball.radius;
            obj.bl = obj.ballradius;
            obj.bb = obj.ballradius;
            obj.br = obj.length(1) - obj.ballradius;
            obj.bu = obj.length(2) - obj.ballradius;
            obj.safedis = (obj.bricklength(1)+obj.ballradius)*(obj.bricklength(1)+obj.ballradius);
        end
    end
end