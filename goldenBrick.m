classdef goldenBrick <block
    properties
        color = 20;
    end
    methods
        function obj = goldenBrick(loc)
            obj.loc = loc;
            obj.life = inf;
            obj.kind = 3;
        end
    end
end