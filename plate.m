classdef plate < block & handle
    properties
        ini = 0;
        friction = 0;
    end
    methods
        function obj = plate()
            obj.kind = 10;
            obj.loc = [100,0];
            obj.length = [5,50];
            
        end
    end
end
