;Header and description

(define (domain restaurant_simulator)


(:requirements :typing :durative-actions :fluents)

(:types chef order_process plate area)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (chef_not_busy ?c - chef) (at ?c - chef ?a - area) 
    (is_meat_plate ?p - plate)(is_vegi_plate ?p - plate)(is_bread_plate ?p - plate);plate properties   
    (area_not_busy ?a - area)(is_breadToaster ?a - area)(is_meatHeater ?a - area)(is_chopBoard ?a - area)
    (is_combination_point ?a - area);predicates of area
    (is_connect ?from ?to - area); if two area are connected

)


(:functions 
    ;order calculate
	(drink_order_Left ?order - order_process)
    (burger_order_left ?order -order_process)

  
    ;food properties (calculate the food left in the plate)
    (cooked_meat_left ?p - plate)
    (vegitable_left ?p - plate)
    (toasted_bread ?p - plate)
    (burger_left ?p - plate)
    

)

; bake meat chef go to the meat area heat, make 2 meat patties and go to combination point place the 
;meat in the plate increase 2 unit
(:durative-action bakeMeat
    :parameters(?c - chef ?meat_heater ?combination_point - area ?meat_plate - plate)
    :duration (=?duration 10)
    :condition(and(at start(and(chef_not_busy ?c)(area_not_busy ?meat_heater)(at ?c ?meat_heater)))
                  (over all(and(is_meatHeater ?meat_heater) (is_meat_plate ?meat_plate))))
    
    :effect (and(at start(not(chef_not_busy ?c)))
                (at start(not(area_not_busy ?meat_heater)))
                (at end(and(chef_not_busy ?c)(area_not_busy ?meat_heater)(not(at ?c ?meat_heater))(at ?c ?combination_point)
                (increase(cooked_meat_left ?meat_plate)2)))
            )
    
)
;toast bread chef go to bread toaster, make 1 pairs of breads and go to combination point place the 
;bread in the plate increase 1 unit
(:durative-action bakeBread
:parameters(?c - chef ?bread_toaster ?combination_point - area ?bread_plate - plate)
    :duration (=?duration 5)
    :condition(and(at start(and(chef_not_busy ?c)(area_not_busy ?bread_toaster)(at ?c ?bread_toaster)))
                  (over all(and(is_breadToaster ?bread_toaster)(is_bread_plate ?bread_plate)))
                )
    
    
    :effect (and(at start(not(chef_not_busy ?c)))
                (at start(not(area_not_busy ?bread_toaster)))
                (at end(and(chef_not_busy ?c)(area_not_busy ?bread_toaster)(not(at ?c ?bread_toaster))(at ?c ?combination_point)
                (increase(toasted_bread ?bread_plate)1)(chef_not_busy ?c)))
    )
    
)


;tchop chef go to chop board, chop vegis and go to combination point place the 
;vegitable in the vegi plate and increase 1 unit
(:durative-action chopVegitable
:parameters(?c - chef ?chop ?combination_point - area ?vegi_plate - plate)
    :duration (=?duration 3)
    :condition(and(at start(and(chef_not_busy ?c)(area_not_busy ?chop)(at ?c ?chop) ))
                  (over all(and(is_chopBoard ?chop)(is_vegi_plate ?vegi_plate))))
    
    
    :effect (and(at start(not(chef_not_busy ?c)))
                (at start(not(area_not_busy ?chop)))
                (at end(and(chef_not_busy ?c)(area_not_busy ?chop)(not(at ?c ?chop))(at ?c ?combination_point)
                (increase(vegitable_left ?vegi_plate)1)))
    )
    
)

; chef move from one location to another
(:durative-action move
    :parameters(?c - chef ?from ?to - area)
    :duration (= ?duration 1)
    :condition (and(at start(and (at ?c ?from) (chef_not_busy ?c)))
                   (over all(and (is_connect ?from ?to)  )) 
                   )
    :effect (and (at start (not(chef_not_busy ?c)))
                 (at start (not(at ?c ?from)))           
                 (at end (and(chef_not_busy ?c)(at ?c ?to)))
    )

)
; make chef make drink atcombination point
(:durative-action makeDrink
    :parameters(?c - chef ?a - area ?order - order_process)
    :duration (= ?duration 1)
    :condition(and (at start(and(area_not_busy ?a)(chef_not_busy ?c)(> (drink_order_Left ?order) 0) ))
                   (over all(and (is_combination_point ?a) (at ?c ?a)
            ))
)
    :effect (and (at start(not(chef_not_busy ?c)))
                 (at start(not(area_not_busy ?a)))
                 (at end(and(chef_not_busy ?c)(area_not_busy ?a)(decrease(drink_order_Left ?order)1)))
    )
)

;chef make burger using the ingredients in the plate
(:durative-action makeBuger
    :parameters(?vegi_plate ?meat_plate ?bread_plate ?burger_plate - plate ?c - chef ?order - order_process ?a - area) 
    :duration(= ?duration 2)
    :condition (and(at start(and(>(cooked_meat_left ?meat_plate)0)(>(vegitable_left ?vegi_plate)0)(>(toasted_bread ?bread_plate)0)))
                    (at start(and(chef_not_busy ?c)(>(burger_order_Left ?order)0)(is_combination_point ?a)))
                    (over all(at ?c ?a))
    )
    :effect(and(at start(not(chef_not_busy ?c)))
               (at end(and(decrease (cooked_meat_left ?meat_plate)1)
                          (decrease (vegitable_left ?vegi_plate)1)
                          (decrease (toasted_bread ?bread_plate)1)
                          (decrease (burger_order_Left ?order)1)
                          (chef_not_busy ?c)))
    )
)
)
