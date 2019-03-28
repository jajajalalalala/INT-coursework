(define (problem order_test) (:domain restaurant_simulator)
(:objects 
    chef1 chef2 - chef
    order_process1 - order_process
    meat_plate vegi_plate bread_plate  - plate
    bread_toaster meat_heater chop_board combination_point - area
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (chef_not_busy chef1)
    (chef_not_busy chef2)
	(at chef1 combination_point)
	(at chef2 combination_point)
	
    (=(burger_order_left order_process1)5)
    (=(drink_order_Left order_process1)2)
	
    (area_not_busy bread_toaster)
    (area_not_busy meat_heater)
    (area_not_busy chop_board)
    (area_not_busy combination_point)
	
    (is_combination_point combination_point)
	(is_breadToaster bread_toaster)
	(is_meatHeater meat_heater)
	(is_chopBoard chop_board)
	
    (is_connect combination_point bread_toaster )
    (is_connect combination_point meat_heater )
    (is_connect meat_heater chop_board)
	
	(is_connect bread_toaster combination_point )
    (is_connect meat_heater combination_point )
    (is_connect chop_board meat_heater )
	
    (is_meat_plate meat_plate)
    (=(cooked_meat_left meat_plate)0)
    (=(vegitable_left meat_plate)0)
    (=(toasted_bread meat_plate)0)
    (=(burger_left meat_plate )0)
	
    (is_vegi_plate vegi_plate)
    (=(cooked_meat_left vegi_plate)0)
    (=(vegitable_left vegi_plate)0)
    (=(toasted_bread vegi_plate)0)
    (=(burger_left vegi_plate)0)
	
    (is_bread_plate bread_plate)
    (=(cooked_meat_left bread_plate)0)
    (=(vegitable_left bread_plate)0)
    (=(toasted_bread bread_plate)0)
    (=(burger_left bread_plate)0)
	

)
 
(:goal (and
    ;todo: put the goal condition here
    (=(burger_order_left order_process1)0)
    (=(drink_order_left order_process1)0)
    )
)
)
;un-comment the following line if metric is needed
;(:metric minimize (???))
)