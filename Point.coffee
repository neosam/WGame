define 'Point', [], ->
  class Point
    constructor: (@x = 0, @y = 0) ->
    add: (p) -> new Point p.x + @x, p.y + @y
    addTo: (p) -> [@x, @y] = [@x + p.x, @y + p.y]
    sub: (p) -> new Point @x - p.x, @y - p.y
    subTo: (p) -> [@x, @y] = [@x - p.x, @y - p.y]
    mult: (x) -> new Point @x * x, @y * x
    multTo: (x) -> [@x, @y] = [@x * x, @y * x]
    length: -> Math.sqrt @x * @x + @y * @y
    squareLength: -> @x * @x + @y * @y

