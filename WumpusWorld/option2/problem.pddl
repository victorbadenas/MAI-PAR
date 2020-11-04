(define (problem wumpusMovingTarget) (:domain wumpusMovingTarget)
    (:objects
    ; Definition of our objects: board coordinates, time, bool value, robot and ghost
        X0 X1 - boardX
        Y0 Y1 Y2 - boardY
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 - time
        true false - boolValue
        agent1 - agent
        wumpus1 - movingWumpus
    )

    (:init
        ; Definition of cost function for the start moment
        (= (cost) 0)


        ; Time axis description, with relative positions from T0 to T9
        (futureTime T0 T1)
        (futureTime T1 T2)
        (futureTime T2 T3)
        (futureTime T3 T4)
        (futureTime T4 T5)
        (futureTime T5 T6)
        (futureTime T6 T7)
        (futureTime T7 T8)
        (futureTime T8 T9)
        
        ; Board configuration below
        ; Description of the how are distributed the X coordinates in the board
        (oneBelowX X0 X1)
        (belowX X0 X1)
        (oneAboveX X1 X0)
        (aboveX X1 X0)


        ; Description of the how are distributed the Y coordinates in the board
        (oneBelowY Y0 Y1)
        (oneBelowY Y1 Y2)
        (belowY Y0 Y2) (belowY Y0 Y1)
        (belowY Y1 Y2)
        (oneAboveY Y1 Y0)
        (oneAboveY Y2 Y1)
        (aboveY Y2 Y0) (aboveY Y2 Y1)
        (aboveY Y1 Y0)

        ; Board coordinates of the robot in the initial position
        (agentAtCoordinateX agent1 X0)
        (agentAtCoordinateY agent1 Y0)


        ; Board coordinates of the ghost in the initial position
        (wumpusAtCoordinateX wumpus1 X1)
        (wumpusAtCoordinateY wumpus1 Y2)


        ; Ghost predefined positions across time
        (positionWumpus X1 Y2 T1)
        ; (positionWumpus X4 Y2 T2)
        ; (positionWumpus X3 Y2 T3)
        ; (positionWumpus X3 Y3 T4)
        ; (positionWumpus X4 Y3 T5)
        ; (positionWumpus X4 Y4 T6)


        ; Global variables
        (canAgentMove true)
        (presentTime T0)
        (usedTime T0)

        ; Special
        (pitPosition X0 Y1)
    )

    (:goal
    ;this specifies that the goal of the plan is to be at the same place (robot and ghost)
        (and
            ; (in_the_same_place true)
            (agentAtCoordinateX agent1 X1)
            (agentAtCoordinateY agent1 Y2)
        )
    )

    (
        ; take into consideration minimizing the cost when deciding the plan
        :metric minimize (cost)
    )
)

