classdef brick < block
    properties
        color = 1;
    end
    methods
        function obj = brick(loc)
            obj.loc = loc;
        end
    end
end