(define (problem wumpusIndex) (:domain wumpusIndex)
    (:objects
    ; Definition of our objects: board coordinates, time, bool value, robot and ghost
        Y0 Y1 - boardY
        X0 X1 X2 - boardX
        agent1 - agent
        wumpus1 - movingWumpus
        arrow1 - arrow
        gold1 - gold
    )

    (:init
        ; Description of the how are distributed the X coordinates in the board
        (oneBelowY Y0 Y1)
        (belowY Y0 Y1)
        (oneAboveY Y1 Y0)
        (aboveY Y1 Y0)


        ; Description of the how are distributed the Y coordinates in the board
        (oneBelowX X0 X1)
        (oneBelowX X1 X2)
        (belowX X0 X2) (belowX X0 X1)
        (belowX X1 X2)
        (oneAboveX X1 X0)
        (oneAboveX X2 X1)
        (aboveX X2 X0) (aboveX X2 X1)
        (aboveX X1 X0)

        (agentAtCoordinateX agent1 X0)
        (agentAtCoordinateY agent1 Y0)
        (wumpusAtCoordinate wumpus1 X2 Y1)
        (pitPosition X1 Y0)
        (alive wumpus1)
        (goldPosition X2 Y0)
    )

    (:goal
        (and
            (agentAtCoordinateX agent1 X0)
            (agentAtCoordinateY agent1 Y0)
            (hasObject gold1 agent1)
        )
    )
)

