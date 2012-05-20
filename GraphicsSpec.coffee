require ['Graphics', 'Rect', 'Point'], (Graphics, Rect, Point) ->
  g = new Graphics()
  describe 'Graphics', ->
    it 'has a setColor metod', ->
      g.setColor('#ffffff')
    it 'has a setFont method', ->
      g.setFont('sans-serif', 12)
    it 'can draw rect (borders and filled) (drawRect, fillRect)', ->
      g.drawRect new Rect 2, 3, 4, 5
      g.fillRect new Rect 2, 3, 4, 5
    it 'can draw circle (borders and filled) (drawCircle, fillCircle)', ->
      g.drawCircle new Point(2, 3), 4
      g.fillCircle new Point(2, 3), 4
