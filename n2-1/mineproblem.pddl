(define (problem n21prob) (:domain n21dom)

    ; DECLARATION OF OBJECTS
    ; 15 tiles and 3 values for the coordinates are necessary
    ; coordinates [0,3]
    ; tiles n**2 - 1 = 15
    (:objects 
        t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - tile
        p0 p1 p2 p3 - coordinate
    )

    ; VARIABLE INICIALIZATION
    (:init
        ; define which values of the coordinates have a difference of 1
        (oneover p3 p2)
        (oneover p2 p1)
        (oneover p1 p0)

        ; define which values of the coordinates have a difference of -1
        (oneunder p0 p1)
        (oneunder p1 p2)
        (oneunder p2 p3)

        ; define free coordinate
        (coordinateFree p2 p0)

        ; define the initial coordinates for the tiles
        (tileAt t1 p2 p1)
        (tileAt t2 p0 p3)
        (tileAt t3 p0 p2)
        (tileAt t4 p1 p1)
        (tileAt t5 p3 p3)
        (tileAt t6 p2 p3)
        (tileAt t7 p1 p2)
        (tileAt t8 p3 p2)
        (tileAt t9 p2 p2)
        (tileAt t10 p1 p0)
        (tileAt t11 p0 p1)
        (tileAt t12 p3 p1)
        (tileAt t13 p3 p0)
        (tileAt t14 p1 p3)
        (tileAt t15 p0 p0)\

        ; initialize cost to 0
        (= (cost) 0)
    )

    ; GOAL DEFINITION
    ; Each of the tiles must be ordered from left to right and the free tile
    ; must be in the 3,3 position.
    (:goal (and
        (tileAt t15 p2 p3)
        (tileAt t14 p1 p3)
        (tileAt t13 p0 p3)
        (tileAt t12 p3 p2)
        (tileAt t11 p2 p2)
        (tileAt t10 p1 p2)
        (tileAt t9 p0 p2)
        (tileAt t8 p3 p1)
        (tileAt t7 p2 p1)
        (tileAt t6 p1 p1)
        (tileAt t5 p0 p1)
        (tileAt t4 p3 p0)
        (tileAt t3 p2 p0)
        (tileAt t2 p1 p0)
        (tileAt t1 p0 p0)
        )
    )

    ; optimize for the minimal cost metric (minimal number of moves).
    (:metric
        minimize(cost)
    )
)
