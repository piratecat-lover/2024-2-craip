# An individual detection - contains bbox, class name, id
# classes = {0: "1", 1: "2", 2: "3", 3: "4", 4: "ac", 5: "ball", 6: "blue", 7: "can", 8: "chair", 9: "door", 10: "foldable_chair", 11: "goal_post", 12: "green", 13: "human", 14: "mission_chair", 15: "red", 16: "sign_circle", 17: "sign_square", 18: "sign_stop", 19: "sign_triangle", 20: "sofa"}


int32 detection_id          # detection id
int32 x_min                 # bounding box pixel coords
int32 y_min
int32 x_max
int32 y_max
int32 class_id              # class id
float32 confidence          # detection confidence [0.0 to 1.0]