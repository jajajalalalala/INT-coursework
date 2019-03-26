(define (problem order_test) (:domain restaurant_simulator)
(:objects 
    chef1 chef2 - chef
    order_process1 - order_process
    meat_plate vegi_plate bread_plate burger_plate - plate
    bread_toaster meat_heating chop_broad combination_point - area
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (chef_not_busy chef1)
    (chef_not_busy chef2)
    (burger_order_not_complete order_process1)
    (=(burger_order_left order_process1)2)
    (drink_order_not_complete order_process1)
    (=(drink_order_Left order_process1)1)
    (area_not_busy bread_toaster)
    (area_not_busy meat_heating)
    (area_not_busy chop_broad)
    (area_not_busy combination_point)
    (is_combination_point combination_point)
    (is_connect bread_toaster combination_point)
    (is_connect meat_heating combination_point)
    (is_connect chop_broad combination_point)
    (is_meat_plate meat_plate)
    (=(cooked_meat_left meat_plate)0)
    (=(vegitable_left meat_plate)0)
    (=(toasted_bread meat_plate0))
    (=(burger_left meat_plate )0)
    (is_vegi_plate vegi_plate)
    (=(cooked_meat_left vegi_plate)0)
    (=(vegitable_left toasted_bread)0)
    (=(toasted_bread vegi_plate)0)
    (=(burger_left vegi_plate)0)
    (is_bread_plate bread_plate)
    (=(cooked_meat_left bread_plate)0)
    (=(vegitable_left bread_plate)0)
    (=(toasted_bread bread_plate)0)
    (=(burger_left bread_plate)0)
    (=(cooked_meat_left burger_plate)0)
    (=(vegitable_left burger_plate)0)
    (=(toasted_bread burger_plate)0)
    (=(burger_left burger_plate)0)
    (=(cooked_meat_left meat_plate)0)
    (=(vegitable_left vegi_plate)0)
    (=(toasted_bread bread_plate)0)
    (=(burger_left burger_plate)0)
)
 
(:goal (and
    ;todo: put the goal condition here
    (burger_order_complete order_process1)
    (drink_order_complete order_process1)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)