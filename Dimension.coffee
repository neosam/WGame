define 'Dimension', [], ->
  class Dimension
    constructor: (@width = 0, @height = 0) ->
    area: -> @width * @height
    mult: (x) -> new Dimension @width * x, @height * x
    multTo: (x) -> [@width, @height] = [@width * x, @height * x]
