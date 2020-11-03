(define (problem wurmpus1) (:domain wurmpus1dom)
    (:objects sq1-1 sq1-2 sq1-3 sq2-1 sq2-2 sq2-3
        arrow gold
        wurmpus player
    )

    (:init
        (isAdjacent sq1-1 sq1-2) (isAdjacent sq1-1 sq2-1)
        (isAdjacent sq1-2 sq1-1) (isAdjacent sq1-2 sq2-2) (isAdjacent sq1-2 sq1-3)
        (isAdjacent sq1-3 sq1-2) (isAdjacent sq1-3 sq2-3)
        (isAdjacent sq2-1 sq1-1) (isAdjacent sq2-1 sq2-2)
        (isAdjacent sq2-2 sq2-1) (isAdjacent sq2-2 sq1-2) (isAdjacent sq2-2 sq2-3)
        (isAdjacent sq2-3 sq2-2) (isAdjacent sq2-3 sq1-3)
        (isPit sq1-2)

        (isInSquare gold sq1-3)

        (isPlayer player)
        (isInSquare player sq1-1)

        (isArrow arrow)
        (hasObject player arrow)

        (isWurmpus wurmpus)
        (isInSquare wurmpus sq2-3)
        (isWurmpusIn sq2-3)
    )

    (:goal (and
        (hasObject player gold)
        (isInSquare player sq1-1))
    )

)
