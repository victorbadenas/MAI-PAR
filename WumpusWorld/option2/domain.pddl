;Header and description

(define (domain wumpusMovingTarget)

    (:requirements
        :strips
        :negative-preconditions
        :equality
        :typing
        :adl
        :fluents
        :action-costs
    )

    (:types
        agent
        movingWumpus
        boardX
        boardY
        time
        boolValue
    )

    (:predicates
        (presentTime    ?t  - time)
        (futureTime     ?t1 - time 
                        ?t2 - time)

        (usedTime       ?t  - time)

        (belowX         ?xa - boardX
                        ?xb - boardX)
        (oneBelowX      ?xa - boardX
                        ?xb - boardX)
        (aboveX         ?xa - boardX
                        ?xb - boardX)
        (oneAboveX      ?xa - boardX
                        ?xb - boardX)

        (belowY         ?ya - boardY
                        ?yb - boardY)
        (oneBelowY      ?ya - boardY
                        ?yb - boardY)
        (aboveY         ?ya - boardY
                        ?yb - boardY)
        (oneAboveY      ?ya - boardY
                        ?yb - boardY)

        (agentAtCoordinateX     ?entity - agent
                                ?x     - boardX)
        (agentAtCoordinateY     ?entity - agent
                                ?y     - boardY)

        (wumpusAtCoordinateX    ?entity - movingWumpus
                                ?x     - boardX)
        (wumpusAtCoordinateY    ?entity - movingWumpus
                                ?y     - boardY)

        (canAgentMove       ?bool - boolValue)

        (positionWumpus     ?indexX - boardX
                            ?indexY - boardY
                            ?time    - time)

        (pitPosition        ?indexX - boardX
                            ?indexY - boardY)
    )

    (:functions
        (cost)
    )

    (:action move_agent_left
        :parameters (
            ?entity - agent
            ?sourceX - boardX
            ?targetX  - boardX
            ?staticY - boardY
        )
        :precondition (and
            (canAgentMove true)
            (not (agentAtCoordinateX ?entity ?targetX))
            (agentAtCoordinateX ?entity ?sourceX)
            (agentAtCoordinateY ?entity ?staticY)
            (not (pitPosition ?targetX ?staticY))
            (oneAboveX ?sourceX ?targetX)
        )
        :effect (and
            (increase (cost) 1)
            (not (canAgentMove true))
            (not (agentAtCoordinateX ?entity ?sourceX))
            (agentAtCoordinateX ?entity ?targetX)
        )
    )
    (:action move_agent_right
        :parameters (
            ?entity - agent
            ?sourceX - boardX
            ?targetX - boardX
            ?staticY - boardY
        )
        :precondition (and
            (canAgentMove true)
            (not (agentAtCoordinateX ?entity ?targetX))
            (agentAtCoordinateX ?entity ?sourceX)
            (agentAtCoordinateY ?entity ?staticY)
            (not (pitPosition ?targetX ?staticY))
            (oneBelowX ?sourceX ?targetX)
        )
        :effect (and
            (increase (cost) 1)
            (not (canAgentMove true))
            (not (agentAtCoordinateX ?entity ?sourceX))
            (agentAtCoordinateX ?entity ?targetX)
        )
    )
    (:action move_agent_down
        :parameters(
            ?entity - agent
            ?sourceY - boardY
            ?targetY - boardY
            ?staticX - boardX
        )
        :precondition (and
            (canAgentMove true)
            (not (agentAtCoordinateY ?entity ?targetY))
            (agentAtCoordinateY ?entity ?sourceY)
            (agentAtCoordinateX ?entity ?staticX)
            (not (pitPosition ?staticX ?targetY))
            (oneBelowY ?sourceY ?targetY)
        )
        :effect (and
            (increase (cost) 1)
            (not (canAgentMove true))
            (not (agentAtCoordinateY ?entity ?sourceY))
            (agentAtCoordinateY ?entity ?targetY)
        )
    )
    (:action move_agent_up
        :parameters (
            ?entity - agent
            ?sourceY - boardY
            ?targetY  - boardY
            ?staticX - boardX
        )
        :precondition (and
            (canAgentMove true)
            (not (agentAtCoordinateY ?entity ?targetY))
            (agentAtCoordinateY ?entity ?sourceY)
            (agentAtCoordinateX ?entity ?staticX)
            (not (pitPosition ?staticX ?targetY))
            (oneAboveY ?sourceY ?targetY)
        )
        :effect (and
            (increase (cost) 1)
            (not (canAgentMove true))
            (not (agentAtCoordinateY ?entity ?sourceY))
            (agentAtCoordinateY ?entity ?targetY)
        )
    )
    (:action wumpus_moves_to_predefined_location
        :parameters(
            ?wumpus - movingWumpus

            ?presentMoment    - time
            ?sourceX - boardX
            ?sourceY - boardY

            ?aheadMoment     - time
            ?targetX  - boardX
            ?targetY  - boardY
        )
        :precondition(
            and
            (not (canAgentMove true))
            (presentTime ?presentMoment)
            (not (presentTime ?aheadMoment))
            (wumpusAtCoordinateX ?wumpus ?sourceX)
            (wumpusAtCoordinateY ?wumpus ?sourceY)
            (positionWumpus ?targetX ?targetY ?aheadMoment)
            (futureTime ?presentMoment ?aheadMoment)
        )
        :effect(
            and
            (canAgentMove true)
            (not (presentTime ?presentMoment ))
            (presentTime ?aheadMoment  )
            (not (wumpusAtCoordinateX ?wumpus ?sourceX ))
            (not (wumpusAtCoordinateY ?wumpus ?sourceY ))
            (wumpusAtCoordinateX ?wumpus ?targetX  )
            (wumpusAtCoordinateY ?wumpus ?targetY  )
            (usedTime ?presentMoment )
        )
    )
    (:action ghost_stays
        :parameters (
            ?wumpus - movingWumpus
            ?presentMoment - time
            ?sourceX - boardX
            ?sourceY - boardY
            ?aheadMoment - time
            ?targetX  - boardX
            ?targetY  - boardY
        )
        :precondition (and
            (not (canAgentMove true))
            (presentTime ?presentMoment )
            (not (presentTime ?aheadMoment))
            (futureTime ?presentMoment ?aheadMoment)
            (wumpusAtCoordinateX ?wumpus ?sourceX )
            (wumpusAtCoordinateY ?wumpus ?sourceY )
            (not (usedTime ?presentMoment ))
        )
        :effect(and
            (canAgentMove true)
            (not (presentTime ?presentMoment))
            (presentTime ?aheadMoment)
        )
    )
)