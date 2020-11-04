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
        gold
        arrow
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

        (wumpusAtCoordinate     ?entity - movingWumpus
                                ?x     - boardX
                                ?y     - boardY)

        (canAgentMove       ?bool - boolValue)

        (positionWumpus     ?indexX - boardX
                            ?indexY - boardY
                            ?time    - time)

        (pitPosition        ?indexX - boardX
                            ?indexY - boardY)
        (alive              ?entity - movingWumpus)

        (goldPosition       ?indexX - boardX
                            ?indexY - boardY)

        (hasObject          ?object - object
                            ?entity - agent)
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
            (forall (?wumpus - movingWumpus) 
                (not (wumpusAtCoordinate ?wumpus ?targetX ?staticY)))
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
            (forall (?wumpus - movingWumpus) 
                (not (wumpusAtCoordinate ?wumpus ?targetX ?staticY)))
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
            (forall (?wumpus - movingWumpus) 
                (not (wumpusAtCoordinate ?wumpus ?staticX ?targetY)))
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
            (forall (?wumpus - movingWumpus) 
                (not (wumpusAtCoordinate ?wumpus ?staticX ?targetY)))
            (oneAboveY ?sourceY ?targetY)
        )
        :effect (and
            (increase (cost) 1)
            (not (canAgentMove true))
            (not (agentAtCoordinateY ?entity ?sourceY))
            (agentAtCoordinateY ?entity ?targetY)
        )
    )
    (:action wumpusMoves
        :parameters(
            ?wumpus - movingWumpus
            ?presentMoment - time
            ?sourceX - boardX
            ?sourceY - boardY
            ?aheadMoment - time
            ?targetX  - boardX
            ?targetY  - boardY
        )
        :precondition(and
            (not (canAgentMove true))
            (presentTime ?presentMoment)
            (not (presentTime ?aheadMoment))
            (wumpusAtCoordinate ?wumpus ?sourceX ?sourceY)
            (positionWumpus ?targetX ?targetY ?aheadMoment)
            (futureTime ?presentMoment ?aheadMoment)
        )
        :effect(and
            (canAgentMove true)
            (not (presentTime ?presentMoment ))
            (presentTime ?aheadMoment  )
            (not (wumpusAtCoordinate ?wumpus ?sourceX ?sourceY))
            (wumpusAtCoordinate ?wumpus ?targetX ?targetY)
            (forall (?agent - agent) (when (and 
                    (not (agentAtCoordinateX ?agent ?targetX))
                    (not (agentAtCoordinateY ?agent ?targetY))
                )
                (and
                    (wumpusAtCoordinate ?wumpus ?sourceX ?sourceY)
                ))
            )
            (usedTime ?presentMoment)
        )
    )
    (:action wumpusStays
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
            (wumpusAtCoordinate ?wumpus ?sourceX ?sourceY)
            (not (usedTime ?presentMoment ))
        )
        :effect (and
            (canAgentMove true)
            (not (presentTime ?presentMoment))
            (presentTime ?aheadMoment)
            (wumpusAtCoordinate ?wumpus ?sourceX ?sourceY)
        )
    )

    (:action wumpusDead
        :parameters (
            ?wumpus - movingWumpus
            ?presentMoment - time
            ?aheadMoment - time
        )
        :precondition (and 
            (not (alive ?wumpus))
            (presentTime ?presentMoment)
            (futureTime ?presentMoment ?aheadMoment)
            (not (usedTime ?presentMoment))
        )
        :effect (and 
            (canAgentMove true)
            (not (presentTime ?presentMoment))
            (presentTime ?aheadMoment)
        )
    )

    (:action shoot
        :parameters (
            ?shooter - agent
            ?shooterX - boardX
            ?shooterY - boardY
            ?victim - movingWumpus
            ?victimX - boardX
            ?victimY - boardY
        )
        :precondition (and 
            (alive ?victim)
            (agentAtCoordinateY ?shooter ?shooterY)
            (agentAtCoordinateX ?shooter ?shooterX)
            (wumpusAtCoordinate ?victim ?victimX ?victimY)
            ; the shooter can shoot if 
            (or
                ; XOR (A or B) and not(A and B)
                (and 
                    (or 
                        (oneAboveX ?shooterX ?victimX)
                        (oneAboveY ?shooterY ?victimY)
                    )
                    (not (and
                        (oneAboveX ?shooterX ?victimX)
                        (oneAboveY ?shooterY ?victimY)
                    ))
                )
                ; XOR (A or B) and not(A and B)
                (and 
                    (or
                        (oneBelowX ?shooterX ?victimX)
                        (oneBelowY ?shooterY ?victimY)
                    )
                    (not (and
                        (oneBelowX ?shooterX ?victimX)
                        (oneBelowY ?shooterY ?victimY)
                    ))
                )
            )
        )
        :effect (and 
            (not (wumpusAtCoordinate ?victim ?victimX ?victimY))
            (not (alive ?victim))
        )
    )

    (:action pickupGold
        :parameters (
            ?object - gold
            ?entity - agent
            ?entityX - boardX
            ?entityY - boardY
        )
        :precondition (and 
            (agentAtCoordinateX ?entity ?entityX)
            (agentAtCoordinateY ?entity ?entityY)
            (goldPosition ?entityX ?entityY)
        )
        :effect (and 
            (hasObject ?object ?entity)
            (not (goldPosition ?entityX ?entityY))
        )
    )
    
)