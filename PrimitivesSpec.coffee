define 'PrimitivesSpec', ['cs!Point', 'cs!Dimension', 'cs!Rect'], (Point, Dimension, Rect) ->
  describe "Point", ->
    point0 = null
    point1 = null
    point2 = null
    beforeEach -> 
      point0 = new Point()
      point1 = new Point 4, 7
      point2 = new Point -2, 60
    it 'should have 0,0 coordinatates if constructor is empty', ->
      (expect point0.x).toEqual 0
      (expect point0.y).toEqual 0
    it 'should have 4,7 coordinates if this was specified in constructor', ->
      (expect point1.x).toEqual 4
      (expect point1.y).toEqual 7
    it 'should be able to add another point', ->
      addition = point1.add point2
      (expect addition.x).toEqual 2
      (expect addition.y).toEqual 67
      (expect point1.x).toEqual 4
      (expect point1.y).toEqual 7
      (expect point2.x).toEqual -2
      (expect point2.y).toEqual 60
    it 'should be able to add another point to itself', ->
      point2.addTo point1
      (expect point1.x).toEqual 4
      (expect point1.y).toEqual 7
      (expect point2.x).toEqual 2
      (expect point2.y).toEqual 67
    it 'should be able to substact another point', ->
      sub = point1.sub point2
      (expect sub.x).toEqual 6
      (expect sub.y).toEqual -53
      (expect point1.x).toEqual 4
      (expect point1.y).toEqual 7
      (expect point2.x).toEqual -2
      (expect point2.y).toEqual 60
    it 'should be able to substract another point to itself', ->
      point2.subTo point1
      (expect point1.x).toEqual 4
      (expect point1.y).toEqual 7
      (expect point2.x).toEqual -6
      (expect point2.y).toEqual 53
    it 'should be able to multiply a scalar variable', ->
      product = point1.mult 2
      (expect product.x).toEqual 8
      (expect product.y).toEqual 14
      (expect point1.x).toEqual 4
      (expect point1.y).toEqual 7
      (expect point2.x).toEqual -2
      (expect point2.y).toEqual 60
    it 'should be able to multiply a scalar variable to itself', ->
      point1.multTo 2
      (expect point1.x).toEqual 8
      (expect point1.y).toEqual 14
    it 'should be able to calculate its distance to origin (length)', ->
      (expect new Point(3, 4).length()).toEqual 5
    it 'should have a square length operator (to avoid sqrt for speed)', ->
      (expect new Point(3, 4).squareLength()).toEqual 25

  describe 'Dimension', ->
    it "will set it's attributes to zero on default constructor", ->
      d = new Dimension()
      (expect d.width).toEqual 0
      (expect d.height).toEqual 0
    it "will set it's attributes correctly", ->
      d = new Dimension(1, 2)
      (expect d.width).toEqual 1
      (expect d.height).toEqual 2
    it "is able to calculate it's area", ->
      (expect new Dimension(4, 5).area()).toEqual 20
    it 'is possible to multiply a scalar variable and get a new object', ->
      d = new Dimension(2, 3).mult 3
      (expect d.width).toEqual 6
      (expect d.height).toEqual 9
    it 'is possible to multiply a scalar variable to itself', ->
      d = new Dimension 2, 3
      d.multTo 3
      (expect d.width).toEqual 6
      (expect d.height).toEqual 9

  describe 'Rect', ->
    it "will set it's own parameter to zero on default constructor", ->
      r = new Rect()
      (expect r.x).toEqual 0
      (expect r.y).toEqual 0
      (expect r.width).toEqual 0
      (expect r.height).toEqual 0
    it "will set it's parameters on value constructor", ->
      r = new Rect 1, 2, 3, 4
      (expect r.x).toEqual 1
      (expect r.y).toEqual 2
      (expect r.width).toEqual 3
      (expect r.height).toEqual 4
    it 'can find out if a point is in the rect or not', ->
      r = new Rect 2, 3, 10, 2
      (expect r.containsPoint new Point 3, 4).toBeTruthy()
      (expect r.containsPoint new Point 3, 10).toBeFalsy()
    it 'will expand by adding points which are not in the rect', ->
      r = new Rect 5, 1, 0, 0
      r.addPoint new Point 2, 3
      console.log r
      console.log r.x
      console.log r.y
      console.log r.width
      console.log r.height
      (expect r.x).toEqual 2
      (expect r.y).toEqual 1
      (expect r.width).toEqual 3
      (expect r.height).toEqual 2
    it 'will not expand if added point is already inside the rect', ->
      r = new Rect 2, 3, 10, 2
      r.addPoint new Point 3, 3
      (expect r.x).toEqual 2
      (expect r.y).toEqual 3
      (expect r.width).toEqual 10
      (expect r.height).toEqual 2
    describe 'the export methods for the corners', ->
      r = new Rect 2, 3, 10, 2
      it 'exports the left top corner', ->
        p = r.getLeftTopCorner()
        (expect p instanceof Point).toBeTruthy()
        (expect p.x).toEqual 2
        (expect p.y).toEqual 3
      it 'exports the right top corner', ->
        p = r.getRightTopCorner()
        (expect p instanceof Point).toBeTruthy()
        (expect p.x).toEqual 12
        (expect p.y).toEqual 3
      it 'exports the left bottom corner', ->
        p = r.getLeftBottomCorner()
        (expect p instanceof Point).toBeTruthy()
        (expect p.x).toEqual 2
        (expect p.y).toEqual 5
      it 'exports the right bottom corner', ->
        p = r.getRightBottomCorner()
        (expect p instanceof Point).toBeTruthy()
        (expect p.x).toEqual 12
        (expect p.y).toEqual 5
    it "can export it's dimension", ->
      r = new Rect 2, 3, 10, 2
      d = r.getDimension()
      (expect d instanceof Dimension).toBeTruthy()
      (expect d.width).toEqual 10
      (expect d.height).toEqual 2
