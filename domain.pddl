;Header and description

(define (domain restaurant_simulator)


(:requirements :typing :durative-actions :fluents)

(:types chef order_process plate area food)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (is_busy ?c - chef)(not_busy ?c - chef) (at ?c - chef ?a - area)  (carry ?c-chef ?f-food)(have_space ?c - chef)
    (is_burger ?f - food)(is_backed_meat ?f - food)(is_chopped_vegi ?f - food)(is_toasted_bread ?f - food)(is_burger ?f - food)(is)
    (is_orgizaed ?b - burger)(is_softDrink ?f-food);From burger
    (is_meat_plate ?p - plate)(is_vegi_plate ?p - plate)(is_bread_plate ?p - plate)(is_Empty ?p - plate);plate properties
    (drink_order_complete ?order - order_process)(burger_order_complete ?order - order_process) ;process order properties
    (is_busy ?a - area)(is_not_busy ?a - area)(is_breadToaster ?a - area)(is_meatHeater ?a - area)(is_chopBoard ?a - area)(is_deliverPoint ?a - area)
    (is_combination_point ?a - area);predicates of area
    (is_connect ?from ?to - area); if two area are connected

)


(:functions 
    ;order calculate
	(drink_order_Left ?order - order_process)
    (burger_order_left ?order -order_process)

    ;food weight
    (toasted_bread_weight ?f - food)
    (meat_weight ?f - food)
    (vegi_weight ?f - food)
    (bread_weight ?f - food)
    (soft_drink_weight ?f - f-food)
    
    
    (vegi_weight ?)
    ;prepare food
	(chop_vegi_time ?c - chef)
    (toast_bread_time ?c - chef)
    (cook_meat_time ?c - chef)
    (construct_burger_time ?c - chef)
    (make_drink_time ?c - chef)
    (deliver_time ?c -chef)
    ;food properties (calculate the food left in the plate)
    (cooked_meat_left ?p - plate)
    (vegitable_left ?p - plate)
    (toasted_bread ?p - plate)
    
    ;chef move  
    (chef_carry_limit ?c -c)
    (chef_move_time ?c - chef ?from ?to - area)
)

; bake meat
(:durative-action bakeMeat
    :parameters(?c - chef ?a - area)
    :duration (=?duration 5)
    :condition(and(at start(not_busy ?c)(is_not_busy ?a))(over all(and(is_meatHeater ?a)(at ?c ?a))
    )
    )
    :parameters()
    
)

(:durative-action bakeBread
)

; chef move from one location to another
(:durative-action move
    :parameters(?c - chef ?from ?to - area)
    :duration (= ?duration 1)
    :condition (over all (and (at ?c ?from)(not_busy ?c)(is_connect ?from ?to)))
    :effect (and (at start(is_busy ?c))(not(at ?c ?from))(at ?c ?to))
)

(:durative-action takeMeat

)
(:durative-action takeBread
)
(:durative-action makeBuger
)
(:durative-action makeDrink
    :parameters(?c - chef ?a - area ?order - order_process)
    :duration (= ?duration 1)
    :condition(and (at start(and((is_not_busy ?a)(not_busy ?c))))
            (over all(and (is_combination_point ?a)(not(drink_order_complete ?order))(at ?c ?a)))
)
    :effect (and (at start(and( is_busy ?a)(is_busy ?c)))
           ( at end(and(not_busy ?c)(is_not_busy ?a)(decrease(drink_order_Left ?order)1)))
    )
)
