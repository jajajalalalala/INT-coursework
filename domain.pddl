;Header and description

(define (domain restaurant_simulator)


(:requirements :typing :durative-actions :fluents)

(:types chef order_process plate area food)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (is_busy ?c - chef)(not_busy ?c - chef) (at ?c - chef ?a - area) 
    (is_meat_plate ?p - plate)(is_vegi_plate ?p - plate)(is_bread_plate ?p - plate);plate properties
    (drink_order_complete ?order - order_process)(burger_order_complete ?order - order_process) ;process order properties
    (is_busy ?a - area)(is_not_busy ?a - area)(is_breadToaster ?a - area)(is_meatHeater ?a - area)(is_chopBoard ?a - area)
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
    :condition(and(at start(and(not_busy ?c)(is_not_busy ?meat_heater)))(over all(and(is_meatHeater ?meat_heater)(at ?c ?meat_heater) (is_meat_plate ?meat_plate))))
    
    
    :effect(and(at start(and(is_busy ?c)(is_busy ?meat_heater)))
                (at end(and(is_not_busy ?c)(is_not_busy ?meat_heater)(at ?c ?combination_point)(is_not_busy ?c)
                (increase(cooked_meat_left ?meat_plate)2)))
            )
    
)
;toast bread chef go to bread toaster, make 1 pairs of breads and go to combination point place the 
;bread in the plate increase 1 unit
(:durative-action bakeBread
:parameters(?c - chef ?bread_toaster ?combination_point - area ?bread_plate - plate)
    :duration (=?duration 5)
    :condition(and(at start(and(not_busy ?c)(is_not_busy ?bread_toaster)))
                (over all(and(is_breadToaster ?bread_toaster)(at ?c ?bread_toaster) (is_bread_plate ?bread_plate)))
                )
    
    
    :effect(and(at start(and(is_busy ?c)(is_busy ?bread_toaster)))
                (at end(and(is_not_busy ?c)(is_not_busy ?bread_toaster)(not(at ?c ?bread_toaster))(at ?c ?combination_point)
                (increase(toasted_bread ?bread_plate)1)(is_not_busy ?c)))
    )
    
)


;tchop chef go to chop board, chop vegis and go to combination point place the 
;vegitable in the vegi plate and increase 1 unit
(:durative-action chopVegitable
:parameters(?c - chef ?chop ?combination_point - area ?vegi_plate - plate)
    :duration (=?duration 3)
    :condition(and(at start(and(not_busy ?c)(is_not_busy ?chop)))(over all(and(is_chopBoard ?chop)(at ?c ?chop) (is_vegi_plate ?vegi_plate))))
    
    
    :effect(and(at start(and(is_busy ?c)(is_busy ?chop)))
                (at end(and(is_not_busy ?c)(is_not_busy ?chop)(not(at ?c ?chop))(at ?c ?combination_point)
                (increase(vegitable_left ?vegi_plate)2)(is_not_busy ?c)))
    )
    
)

; chef move from one location to another
(:durative-action move
    :parameters(?c - chef ?from ?to - area)
    :duration (= ?duration 1)
    :condition (over all (and (at ?c ?from)(not_busy ?c)(is_connect ?from ?to)))
    :effect (and (at start(and(is_busy ?c)(not(at ?c ?from))(at ?c ?to)))
    (at end(and(is_not_busy ?c)(at ?c ?to)(not(at ?c ?from))))
    )

)
; make chef make drink atcombination point
(:durative-action makeDrink
    :parameters(?c - chef ?a - area ?order - order_process)
    :duration (= ?duration 1)
    :condition(and (at start(and(is_not_busy ?a)(not_busy ?c)))
            (over all(and (is_combination_point ?a) (> (drink_order_Left ?order) 0) (at ?c ?a)
            (not(drink_order_complete ?order))))
)
    :effect (and (at start(and( is_busy ?a)(is_busy ?c)))
           ( at end(and(not_busy ?c)(is_not_busy ?a)(decrease(drink_order_Left ?order)1)))
    )
)

;chef make burger using the ingredients in the plate
(:durative-action makeBuger
    :parameters(?vegi_plate ?meat_plate ?bread_plate ?burger_plate - plate ?c - chef ?order - order_process ?a - area) 
    :duration(= ?duration 2)
    :condition (and(over all(and(>(cooked_meat_left ?meat_plate)0)(>(vegitable_left ?vegi_plate)0)(>(toasted_bread ?bread_plate)0)))
                    (at start(and(not_busy ?c)(>(burger_order_Left ?order)1)(is_combination_point ?a)))
    )
    :effect(and(at start(is_busy ?c))
    (at end(and(decrease (cooked_meat_left ?meat_plate)1)(decrease (vegitable_left ?vegi_plate)1)(decrease (toasted_bread ?bread_plate)1)(decrease (burger_order_Left ?order)1)(not_busy ?c)))
    )
)
)