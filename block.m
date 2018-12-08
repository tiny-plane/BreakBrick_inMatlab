classdef block
    properties
        kind = 1;
        loc = [100,100];
        hit = 0;
        life = 1;
        render = 0;
        length = [10,30];
    end
    methods
        function obj = block()
            
        end
    end
    methods (Static)
        function obj = Hitonce(obj)
            obj.life = obj.life -1;
            if obj.life < 1
                obj.render = 0;
            end
        end
    end
end