// jassco: include("io.asc")
// jassco: include("graph.asc")
// jassco: include("math.asc")
var canvas = document.getElementById("myCanvas")
var ctx = canvas.getContext("2d")

function sierpinski(x1, y1, x2, y2, x3, y3, level) {
    if (level <= 0) {
        ctx.moveTo(x1, y1)
        ctx.lineTo(x2, y2)
        ctx.lineTo(x3, y3)
        ctx.lineTo(x1, y1)
    }
    else {
        sierpinski(
            x1,
            y1,
            (x1 + x2) / 2,
            (y1 + y2) / 2,
            (x1 + x3) / 2,
            (y1 + y3) / 2,
            level - 1
        )

        sierpinski(
            (x1 + x2) / 2,
            (y1 + y2) / 2,
            x2,
            y2,
            (x2 + x3) / 2,
            (y2 + y3) / 2,
            level - 1
        )

        sierpinski(
            (x1 + x3) / 2,
            (y1 + y3) / 2,
            (x2 + x3) / 2,
            (y2 + y3) / 2,
            x3,
            y3,
            level - 1
        )
    }
}

sierpinski(20, 20, 70, 120, 120, 20, 4)
console.log("Sierpinski recursive")

