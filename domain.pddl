;Header and description

(define (domain restaurant_simulator)


(:requirements :typing :durative-actions :fluents)

(:types chef order_process softDrink plate area burger)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (is_busy ?c - chef)(not_busy ?c - chef) (at ?c - chef ?a - area)  (carry ?c-chef ?f-food)
    (has_meat ?b - burger) (has_vegitable ?b - burger) (has_bread ?b - burger) (is_orgizaed ?b - burger);From burger
    (is_meat_plate ?p - plate)(is_vegi_plate ?p - plate)(is_bread_plate ?p - plate)(is_Empty ?p - plate);plate properties
    (drink_order_complete ?order - order_process)(burger_order_complete ?order - order_process) ;process order properties
    (is_busy ?a - area)(is_not_busy ?a - area)(is_breadToaster ?a - area)(is_meatHeater ?a - area)(is_chopBoard ?a - area)(is_deliverPoint ?a - area)
    (is_combination_point ?a - area);predicates of area
    (is_connect ?from ?to - area); if two area are connected

)


(:functions 
	(Order-Left ?b - burger ?d - drink)
	(total-time)
)

(:durative-action bakeMeat
)

(:durative-action bakeBread
)

(:durative-action move
)

(:durative-action takeMeat
)
(:durative-action takeBread
)
(:durative-action makeBuger
)
(:durative-action makeDrink
)
(:durative-action deliverOrder
)
