classdef plate < handle
    properties
        kind = 1;
        loc = [100,100];
        hit = 0;
        life = 1;
        render = 0;
        length = [30,10];
        ini = 0;
        friction = 0;
    end
    methods
        function obj = plate()
            obj.kind = 5;
            obj.loc = [100,0];
            obj.length = [50,5];            
        end
    end
end
