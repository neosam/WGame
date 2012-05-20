define 'Rect', ['Point', 'Dimension'], (Point, Dimension) ->
  class Rect
    constructor: (@x = 0, @y = 0, @width = 0, @height = 0) ->
    containsPoint: (p) -> p.x >= @x and p.y >= @y \
                     and  p.x < @x + @width \
                     and  p.y < @y + @height
    addPoint: (p) ->
      if @containsPoint p
        return
      if p.x < @x
        @width += @x - p.x
        @x = p.x
      else if p.x >= @x + @width
        @width += p.x - @x
      if p.y < @y
        @height += @y - p.y
        @y = p.y
      else if p.y >= @y + @height
        @height += p.y - @y

    getLeftTopCorner: -> new Point @x, @y
    getRightTopCorner: -> new Point @x + @width, @y
    getLeftBottomCorner: -> new Point @x, @y + @height
    getRightBottomCorner: -> new Point @x + @width, @y + @height
    getDimension: -> new Dimension @width, @height
