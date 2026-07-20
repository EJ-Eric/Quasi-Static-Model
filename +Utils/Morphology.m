classdef Morphology
    %MORPHOLOGY Morphological description of Drosophila
    %   A container for a morphological model of Drosophila

    properties
        Wing_LH
        Wing_RH
        Body
        Total
    end

    methods
        function obj = Morphology(left_wing_shape,right_wing_shape,Fly_Data)
            %MORPHOLOGY Construct an instance of this class
            %   Detailed explanation goes here
            obj.Body = Init_Body(['Data_Sets' filesep 'Dataset_S1.mat']);
        end

        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

%% PRIVATE FUNCTIONS
function body = Init_Body(model_path)
%INIT_BODY Construct body structure
% loads the body model from Muijres 2017 to analyze geometric properties
% Note that unlike the kinematic data, this is NOT easily substitutable
% for another dataset, and thus is hardcoded. If you wish to do so, you
% must edit this code to match.

load(model_path, 'body_model');

% allocate the body structure
body = struct( ...
    "x_mod", body_model.x_mod,... first extract the model info...
    "y_mod", body_model.y_mod,...
    "z_mod", body_model.z_mod,...
    "joints",[body_model.Joint_left';body_model.Joint_right'],...
    "center_of_gravity", body_model.cg_b,...
    "R_strk", body_model.R_strk,...
    "volume",NaN,... then allocate space for some geometric properties
    "mass", NaN,...
    "inertia", NaN(3),...
    "body_angle", NaN);

% Segment the body: we will use convexHull to calculate volume, but this
% body model is NOT completely convex. Therefore we need to segment it into
% head, thorax, and abdomen parts first.
abdomen_idx = 1:10;
thorax_idx = 10:15;
head_idx = 15:21;


end