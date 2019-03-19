;Header and description

(define (domain restaurant_simulator)


(:requirements :typing :durative-actions :fluents)


(:types chef order_process baked_meat chopped_vegetable toasted_bread softDrink burger plate area burger
)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (is_busy ?chef)(not_busy ?chef)
    (has_meat ?burger) (has_vegitable ?burger) (has_bread ? burger) (is_orgizaed ?burger);From burger
    (is_meat_plate ?plate)(is_vegi_plate ?plate)(is_bread_plate ?plate);plate properties
    (drink_order_complete ?order_process)(burger_order_complete ?order_process) ;process order properties
    (is_busy ?area)(is_not_busy ?area(is_breadToaster ?area)(is_meatHeater ?area)(is_chopBoard ?area)(is_deliverPoint ?area)
    (is_combination_point ?area);predicates of area
    (is_connect ?area ?area); if two area is connected

    )


(:functions ;todo: define numeric functions here
)

;define actions here

)