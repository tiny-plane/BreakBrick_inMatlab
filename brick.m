classdef brick < block
    properties
        color = 1;
    end
    methods
        function obj = brick(loc)
            obj.loc = loc;
            obj.color = randperm(4,1);
        end
    end
end