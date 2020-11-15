(define (problem n21prob) (:domain n21dom)
    (:objects 
        t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - tile
        x0 x1 x2 x3 - coordinate
        y0 y1 y2 y3 - coordinate
    )

    (:init
        (coordinateFree x2 y0)
        (tileAt t1 x2 y1)
        (tileAt t2 x0 y3)
        (tileAt t3 x0 y2)
        (tileAt t4 x1 y1)
        (tileAt t5 x3 y3)
        (tileAt t6 x2 y3)
        (tileAt t7 x1 y2)
        (tileAt t8 x3 y2)
        (tileAt t9 x2 y2)
        (tileAt t10 x1 y0)
        (tileAt t11 x0 y1)
        (tileAt t12 x3 y1)
        (tileAt t13 x3 y0)
        (tileAt t14 x1 y3)
        (tileAt t15 x0 y0)

        (oneabove y3 y2)
        (oneabove y2 y1)
        (oneabove y1 y0)

        (onebelow y0 y1)
        (onebelow y1 y2)
        (onebelow y2 y3)

        (oneleft x3 x2)
        (oneleft x2 x1)
        (oneleft x1 x0)

        (oneright x0 x1)
        (oneright x1 x2)
        (oneright x2 x3)

    )

    (:goal (and
        (tileAt t1 x0 y0)
        (tileAt t2 x1 y0)
        (tileAt t3 x2 y0)
        (tileAt t4 x3 y0)
        (tileAt t5 x0 y1)
        (tileAt t6 x1 y1)
        (tileAt t7 x2 y1)
        (tileAt t8 x3 y1)
        (tileAt t9 x0 y2)
        (tileAt t10 x1 y2)
        (tileAt t11 x2 y2)
        (tileAt t12 x3 y2)
        (tileAt t13 x0 y3)
        (tileAt t14 x1 y3)
        (tileAt t15 x2 y3)
        (coordinateFree x3 y3)
        )
    )

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
