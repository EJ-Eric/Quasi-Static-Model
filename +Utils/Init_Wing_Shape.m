function Shape = Init_Wing_Shape(Wing_x_data,Wing_y_data,Wing_z_data)

% first, remove any duplicate points 
% duplicate points can cause issues with calculating geometric properties
points = [Wing_x_data',Wing_y_data',Wing_z_data'];
[~,unique_indices,~] = unique(points,"first","rows");
unique_indices = sort(unique_indices);
points = points(unique_indices,:);

% assign coordinate data
Shape.points = points;

% find wing root, the point with the smallest x-value
Shape.root_index = find(points(:,1) == min(points(:,1)));
Shape.root = points(Shape.root_index);

% find wing tip, the point with the highest x-value
Min_1 = find(Wing_x_data == max(Wing_x_data),1,"first");
Min_2 = find(Wing_x_data == max(Wing_x_data),1,"last");   
if Min_1 ~= Min_2
    Min_12 = Min_1;
else
    Min_12 = round(Min_1 + (Min_2-Min_1)/2);
end
Shape.Wing_tip_index = Min_12;
Shape.Wing_tip = [Wing_x_data(Min_12), Wing_y_data(Min_12)];

end