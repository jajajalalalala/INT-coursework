(define (problem order_test) (:domain restaurant_simulator)
(:objects 
    chef1 chef2 chef3 chef4 - chef
    order_process1 - order_process
    meat_plate vegi_plate bread_plate  - plate
    bread_toaster1 bread_toaster2 meat_heater1 meat_heater2 meat_heater3 chop_board combination_point - area
)


(:init
    ;todo: put the initial state's facts and numeric values here
    (chef_not_busy chef1)
    (chef_not_busy chef2)
	(chef_not_busy chef3)
	(chef_not_busy chef4)
	
	(at chef1 combination_point)
	(at chef2 combination_point)
	(at chef3 combination_point)
	(at chef4 combination_point)
	
    (burger_order_not_complete order_process1)
    (=(burger_order_left order_process1)13)
    (drink_order_not_complete order_process1)
    (=(drink_order_Left order_process1)6)
	
    (area_not_busy bread_toaster1)
	(area_not_busy bread_toaster2)
    (area_not_busy meat_heater1)
	(area_not_busy meat_heater2)
	(area_not_busy meat_heater3)
    (area_not_busy chop_board)
    (area_not_busy combination_point)
	
    (is_combination_point combination_point)
	(is_breadToaster bread_toaster1)
	(is_breadToaster bread_toaster2)
	(is_meatHeater meat_heater1)
	(is_meatHeater meat_heater2)
	(is_meatHeater meat_heater3)
	(is_chopBoard chop_board)
	
    (is_connect combination_point bread_toaster1)
	(is_connect combination_point chop_board)
	(is_connect combination_point meat_heater3)
	(is_connect combination_point meat_heater2)
	
	(is_connect chop_board combination_point)
	(is_connect chop_board bread_toaster1)
	(is_connect chop_board meat_heater3)
	
	(is_connect bread_toaster1 combination_point)
	(is_connect bread_toaster1 meat_heater1)
	(is_connect bread_toaster1 chop_board)
	
	(is_connect meat_heater1 bread_toaster1)
	(is_connect meat_heater1 meat_heater2)
	
	(is_connect meat_heater2 meat_heater1)
	(is_connect meat_heater2 combination_point)
	(is_connect meat_heater2 bread_toaster2)
	
	(is_connect bread_toaster2 meat_heater2)
	(is_connect bread_toaster2 meat_heater3)
	
	(is_connect meat_heater3 combination_point)
	(is_connect meat_heater3 bread_toaster2)
	(is_connect meat_heater3 chop_board)
	
	
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