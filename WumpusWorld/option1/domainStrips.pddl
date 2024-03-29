(define (domain wurmpus1dom)

    (:requirements 
        :strips
    )

    (:predicates
        (isAdjacent ?sq1 ?sq2)
        (isPit ?sq)
        (isWurmpus ?agent)
        (isPlayer ?agent)
        (isArrow ?object)
        (isDead ?agent)
        (hasObject ?agent ?object)
        (isWurmpusIn ?sq)
        (isInSquare ?obj ?sq)
    )

    (:action movePlayer
        :parameters (?sqf ?sqt ?agent)
        :precondition (and
            (isPlayer ?agent)
            (isInSquare ?agent ?sqf)
            (isAdjacent ?sqf ?sqt)
            (not (isPit ?sqt))
            (not (isWurmpusIn ?sqt))
        )
        :effect (and (not (isInSquare ?agent ?sqf))
            (isInSquare ?agent ?sqt)
        )
    )

    (:action pickupObject
        :parameters (?agent ?obj ?sq)
        :precondition (and (isPlayer ?agent)
            (isInSquare ?agent ?sq)
            (isInSquare ?obj ?sq)
        )
        :effect (and (hasObject ?agent ?obj)
            (not (isInSquare ?obj ?sq)))
    )

    (:action shoot
        :parameters (?shooterAgent ?shooterSq ?targetAgent ?targetSq ?obj)
        :precondition (and (isPlayer ?shooterAgent)
            (hasObject ?shooterAgent ?obj)
            (isArrow ?obj)
            (isInSquare ?shooterAgent ?shooterSq)
            (isWurmpus ?targetAgent)
            (isInSquare ?targetAgent ?targetSq)
            (isAdjacent ?shooterSq ?targetSq))
        :effect (and (isDead ?targetAgent)
            (not (isWurmpusIn ?targetSq))
            (not (hasObject ?shooterAgent ?obj))
        )
    )
)