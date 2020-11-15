;Header and description

(define (domain n21dom)

    ;remove requirements that are not needed
    (:requirements :strips :adl)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        tile
        coordinate
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (coordinateFree ?x - coordinate ?y - coordinate)
        (tileAt ?t - tile ?x - coordinate ?y - coordinate)
        (oneabove ?x - coordinate ?x2 - coordinate)
        (onebelow ?x - coordinate ?x2 - coordinate)
        (oneleft ?x - coordinate ?x2 - coordinate)
        (oneright ?x - coordinate ?x2 - coordinate)
    )


    (:functions ;todo: define numeric functions here
    )

    ;define actions here
    (:action move-left
        :parameters (
            ?t - tile
            ?xold - coordinate
            ?xnew - coordinate
            ?y - coordinate
        )
        :precondition (and 
            (coordinateFree ?xnew ?y)
            (oneleft ?xold ?xnew)
            (tileAt ?t ?xold ?y)
        )
        :effect (and 
            (not (coordinateFree ?xnew ?y))
            (not (tileAt ?t ?xold ?y))
            (tileAt ?t ?xnew ?y)
            (coordinateFree ?xold ?y)
        )
    )

    (:action move-right
        :parameters (
            ?t - tile
            ?xold - coordinate
            ?xnew - coordinate
            ?y - coordinate
        )
        :precondition (and 
            (coordinateFree ?xnew ?y)
            (oneright ?xold ?xnew)
            (tileAt ?t ?xold ?y)
        )
        :effect (and 
            (not (coordinateFree ?xnew ?y))
            (not (tileAt ?t ?xold ?y))
            (tileAt ?t ?xnew ?y)
            (coordinateFree ?xold ?y)
        )
    )

    (:action move-up
        :parameters (
            ?t - tile
            ?x - coordinate
            ?yold - coordinate
            ?ynew - coordinate
        )
        :precondition (and 
            (coordinateFree ?x ?ynew)
            (oneabove ?yold ?ynew)
            (tileAt ?t ?x ?yold)
        )
        :effect (and 
            (not (coordinateFree ?x ?ynew))
            (not (tileAt ?t ?x ?yold))
            (tileAt ?t ?x ?ynew)
            (coordinateFree ?x ?yold)
        )
    )

    (:action move-down
        :parameters (
            ?t - tile
            ?x - coordinate
            ?yold - coordinate
            ?ynew - coordinate
        )
        :precondition (and 
            (coordinateFree ?x ?ynew)
            (onebelow ?yold ?ynew)
            (tileAt ?t ?x ?yold)
        )
        :effect (and 
            (not (coordinateFree ?x ?ynew))
            (not (tileAt ?t ?x ?yold))
            (tileAt ?t ?x ?ynew)
            (coordinateFree ?x ?yold)
        )
    )

)