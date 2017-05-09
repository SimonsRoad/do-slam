classdef GEO_Plane < GeometricEntityObject
    %GEO_PLANE Summary of this class goes here
    %   Detailed explanation goes here
    
    %% 1. Properties
    properties(GetAccess = 'protected', SetAccess = 'protected')
        normal
        distance
    end
    
    
    %% 2. Methods   
    % Constructor
    methods(Access = public)
        function self = GEO_Plane(rectangle)
            switch nargin
                case 0
                otherwise
                    self.index = rectangle.get('index');
                    pose = rectangle.get('GP_Pose',0);
                    position = pose.get('R3xso3Position');
                    R = pose.get('R');
                    %compute parameters
                    normal = R(:,3);
                    distance = dot(position,normal);
                    %constrain distance >= 0
                    if distance < 0
                        self.normal   = -normal;
                        self.distance = -distance;
                    else
                        self.normal   = normal;
                        self.distance = distance;
                    end
                        
            end
        end
        
    end
    
    % Getter & Setter
    methods(Access = public) %set to protected later??
        function out = getSwitch(self,property,varargin)
            switch property 
                case 'parameters'
                    out = [self.normal; self.distance];
                otherwise
                    out = self.(property);
            end
        end
        
        function self = setSwitch(self,property,value)
        	self.(property) = value;
        end
    end
    
end

