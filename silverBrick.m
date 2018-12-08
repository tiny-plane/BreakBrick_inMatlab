classdef silverBrick <block
    properties
        color = 10;
    end
    methods
        function obj = silverBrick(loc)
            obj.loc = loc;
            obj.life = 2;
            obj.kind = 2;
        end
    end
end