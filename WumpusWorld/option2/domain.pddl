;Header and description

(define (domain wumpusIndex)

    (:requirements
        :strips
        :negative-preconditions
        :equality
        :typing
        :adl
        :fluents
    )

    (:types
        agent
        movingWumpus
        boardX
        boardY
        boolValue
        gold
        arrow
    )

    (:predicates
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

        (positionWumpus     ?indexX - boardX
                            ?indexY - boardY)

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
            (not (agentAtCoordinateY ?entity ?sourceY))
            (agentAtCoordinateY ?entity ?targetY)
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