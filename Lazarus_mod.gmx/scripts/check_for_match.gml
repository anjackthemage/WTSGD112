// This script should be called when a falling box collides with another box and stops
// (not when it crushes the lower box)
// This will check for a 3x box match:
//      3 of the same boxes in a row (horizontal, vertical or diagonal)
//      4 boxes in order (cardboard = 1, wood = 2, steel = 3, stone = 4)

// Usage: check_for_match(box, pos[])
//      Where "box" is a box which we know exists (such as the falling box)



var box_active = argument[0];
var line_map = ds_stack_create();
// The rough half-circle over which we'll be iterating
ds_stack_push(line_map, -1, -1, 0, -1, 1, -1, 1, 0)

line_checker(box_active, line_map);
