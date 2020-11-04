(define (problem wumpusIndex) (:domain wumpusIndex)
    (:objects
    ; Definition of our objects: board coordinates, time, bool value, robot and ghost
        Y0 Y1 - boardY
        X0 X1 X2 - boardX
        true false - boolValue
        agent1 - agent
        wumpus1 - movingWumpus
        arrow1 - arrow
        gold1 - gold
    )

    (:init
        ; Definition of cost function for the start moment
        (= (cost) 0)


        ; Time axis description, with relative positions from T0 to T9
        
        ; Board configuration below
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

        ; Board coordinates of the robot in the initial position
        (agentAtCoordinateX agent1 X0)
        (agentAtCoordinateY agent1 Y0)


        ; Board coordinates of the ghost in the initial position
        (wumpusAtCoordinate wumpus1 X2 Y1)

        ; Special
        (pitPosition X1 Y0)
        (alive wumpus1)
        (goldPosition X2 Y0)
    )

    (:goal
    ;this specifies that the goal of the plan is to be at the same place (robot and ghost)
        (and
            ; (in_the_same_place true)
            (agentAtCoordinateX agent1 X0)
            (agentAtCoordinateY agent1 Y0)
            (hasObject gold1 agent1)
        )
    )
)

