(define (problem wumpus) (:domain wumpus_adl)
    (:objects sq1-1 sq1-2 sq1-3 sq2-1 sq2-2 sq2-3 - square
        arrow-1 - arrow
        gold-1 - gold
        wumpus-1 - wumpus
        player-1 - agent
    )

    (:init
        (isAdjacent sq1-1 sq1-2) (isAdjacent sq1-1 sq2-1)
        (isAdjacent sq1-2 sq1-1) (isAdjacent sq1-2 sq2-2) (isAdjacent sq1-2 sq1-3)
        (isAdjacent sq1-3 sq1-2) (isAdjacent sq1-3 sq2-3)
        (isAdjacent sq2-1 sq1-1) (isAdjacent sq2-1 sq2-2)
        (isAdjacent sq2-2 sq2-1) (isAdjacent sq2-2 sq1-2) (isAdjacent sq2-2 sq2-3)
        (isAdjacent sq2-3 sq2-2) (isAdjacent sq2-3 sq1-3)
        (isPit sq1-2)

        (isInSquare gold-1 sq1-3)

        (isAlive player-1)
        (isInSquare player-1 sq1-1)

        (hasObject player-1 arrow-1)

        (isInSquare wumpus-1 sq2-3)
        (isAlive wumpus-1)
    )

    (:goal (and
        (isAlive player-1)
        (isInSquare player-1 sq1-1)
        (hasObject player-1 gold-1)
        )
    )
)
