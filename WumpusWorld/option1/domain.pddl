(define (domain wumpus_adl)

    (:requirements
        :strips
        :typing
        :adl)

    (:types
        agent wumpus square gold arrow
    )

    (:predicates
        (isAdjacent ?sq1 ?sq2)
        (isPit ?sq)
        (isInSquare ?entity ?sq)
        (hasObject ?entity ?object)
        (isAlive ?entity)
    )

    (:action movePlayer
        :parameters (
            ?entity - agent
            ?sqf - square
            ?sqt - square
        )
        :precondition (and
            (isInSquare ?entity ?sqf)
            (isAdjacent ?sqf ?sqt)
            (isAlive ?entity)
            (not (isPit ?sqt))
            (forall (?wumpus - wumpus)
                (not (isInSquare ?wumpus ?sqt))
            )
        )
        :effect (and 
            (not (isInSquare ?entity ?sqf))
            (isInSquare ?entity ?sqt)
        )
    )

    (:action pickupObject
        :parameters (
            ?entity - agent
            ?obj - object
            ?sq - square
        )
        :precondition (and 
            (isInSquare ?entity ?sq)
            (isInSquare ?obj ?sq)
            (isAlive ?entity)
        )
        :effect (and 
            (hasObject ?entity ?obj)
            (not (isInSquare ?obj ?sq))
        )
    )

    (:action shootArrow
        :parameters (
            ?entity - agent
            ?entitySq - square
            ?victim - wumpus
            ?victimSq - square
            ?obj - arrow
        )
        :precondition (and 
            (isAlive ?entity)
            (hasObject ?entity ?obj)
            (isInSquare ?entity ?entitySq)
            (isAlive ?victim)
            (isInSquare ?victim ?victimSq)
            (isAdjacent ?entitySq ?victimSq)
        )
        :effect (and 
            (not (isAlive ?victim))
            (not (isInSquare ?victim ?victimSq))
            (not (hasObject ?entity ?obj))
        )
    )
)