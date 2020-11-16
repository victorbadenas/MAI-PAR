(define (domain n21dom)

    ; added adl and strips for object declaration and cost function
    ; implementation respectively
    (:requirements :strips :adl :fluents)

    (:types
        tile
        coordinate
    )

    ; just 4 predicates are needed for the execution of the plan:
    ; the position of the coordinate that is empty
    ; the position of each tile with its coordinates
    ; if the coordinates x and y are at a distance of 1
    ; if the coordinates x and y are at a distance of -1
    (:predicates
        (coordinateFree ?x - coordinate ?y - coordinate)
        (tileAt ?t - tile ?x - coordinate ?y - coordinate)
        (oneover ?i - coordinate ?j - coordinate)
        (oneunder ?i - coordinate ?j - coordinate)
    )

    ; cost function declaration
    (:functions ;todo: define numeric functions here
        (cost)
    )

    ; 4 actions are neeced: move tile to each of the 4 directions
    
    ; MOVE LEFT
    ; The move left action takes the tile, the old x coordinate
    ; the new x coordinate and the y coordinate.
    ; The precondition for the action is for the target coordinate
    ; to be free, to be at a distance of 1 and for the tile to be moved
    ; to be in the source coordinate
    ; The effect of the action is that the tile is no longer at the
    ; old location but it is in the new one. The coordinate xnew y is
    ; not free anymore and the xold y is now free.
    ; The movement causes the cost to increase by one.
    (:action move-left
        :parameters (
            ?t - tile
            ?xold - coordinate
            ?xnew - coordinate
            ?y - coordinate
        )
        :precondition (and 
            (coordinateFree ?xnew ?y)
            (oneover ?xold ?xnew)
            (tileAt ?t ?xold ?y)
        )
        :effect (and 
            (not (coordinateFree ?xnew ?y))
            (not (tileAt ?t ?xold ?y))
            (tileAt ?t ?xnew ?y)
            (coordinateFree ?xold ?y)
            (increase (cost) 1)
        )
    )

    ; MOVE RIGHT
    ; The move right action takes the tile, the old x coordinate
    ; the new x coordinate and the y coordinate.
    ; The precondition for the action is for the target coordinate
    ; to be free, to be at a distance of 1 and for the tile to be moved
    ; to be in the source coordinate
    ; The effect of the action is that the tile is no longer at the
    ; old location but it is in the new one. The coordinate xnew y is
    ; not free anymore and the xold y is now free.
    ; The movement causes the cost to increase by one.
    (:action move-right
        :parameters (
            ?t - tile
            ?xold - coordinate
            ?xnew - coordinate
            ?y - coordinate
        )
        :precondition (and 
            (coordinateFree ?xnew ?y)
            (oneunder ?xold ?xnew)
            (tileAt ?t ?xold ?y)
        )
        :effect (and 
            (not (coordinateFree ?xnew ?y))
            (not (tileAt ?t ?xold ?y))
            (tileAt ?t ?xnew ?y)
            (coordinateFree ?xold ?y)
            (increase (cost) 1)
        )
    )

    ; MOVE UP
    ; The move up action takes the tile, the old y coordinate
    ; the new y coordinate and the x coordinate.
    ; The precondition for the action is for the target coordinate
    ; to be free, to be at a distance of 1 and for the tile to be moved
    ; to be in the source coordinate
    ; The effect of the action is that the tile is no longer at the
    ; old location but it is in the new one. The coordinate x ynew is
    ; not free anymore and the x yold is now free.
    ; The movement causes the cost to increase by one.
    (:action move-up
        :parameters (
            ?t - tile
            ?x - coordinate
            ?yold - coordinate
            ?ynew - coordinate
        )
        :precondition (and 
            (coordinateFree ?x ?ynew)
            (oneover ?yold ?ynew)
            (tileAt ?t ?x ?yold)
        )
        :effect (and 
            (not (coordinateFree ?x ?ynew))
            (not (tileAt ?t ?x ?yold))
            (tileAt ?t ?x ?ynew)
            (coordinateFree ?x ?yold)
            (increase (cost) 1)
        )
    )

    ; MOVE DOWN
    ; The move up action takes the tile, the old y coordinate
    ; the new y coordinate and the x coordinate.
    ; The precondition for the action is for the target coordinate
    ; to be free, to be at a distance of 1 and for the tile to be moved
    ; to be in the source coordinate
    ; The effect of the action is that the tile is no longer at the
    ; old location but it is in the new one. The coordinate x ynew is
    ; not free anymore and the x yold is now free.
    ; The movement causes the cost to increase by one.
    (:action move-down
        :parameters (
            ?t - tile
            ?x - coordinate
            ?yold - coordinate
            ?ynew - coordinate
        )
        :precondition (and 
            (coordinateFree ?x ?ynew)
            (oneunder ?yold ?ynew)
            (tileAt ?t ?x ?yold)
        )
        :effect (and 
            (not (coordinateFree ?x ?ynew))
            (not (tileAt ?t ?x ?yold))
            (tileAt ?t ?x ?ynew)
            (coordinateFree ?x ?yold)
            (increase (cost) 1)
        )
    )

)