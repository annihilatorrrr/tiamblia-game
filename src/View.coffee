
class @View
	constructor: ->
		@center_x = 0
		@center_y = 0
		@scale = 1
		@center_x_to = 0
		@center_y_to = 0
		@scale_to = 1
		@width = 1
		@height = 1
		@follow_smoothness = 4
		@zoom_smoothness = 40
	
	step: ->
		@center_x += (@center_x_to - @center_x) / @follow_smoothness
		@center_y += (@center_y_to - @center_y) / @follow_smoothness
		@scale += (@scale_to - @scale) / @zoom_smoothness
	
	testRect: (x, y, width, height, padding=0)->
		# @center_x - @width / 2 + padding >= x >= @center_x + @width / 2 - padding and
		# @center_y - @height / 2 + padding >= y >= @center_y + @height / 2 - padding
		# @center_x - @width / 2 / @scale + padding / @scale <= x <= @center_x + @width / 2 / @scale - padding / @scale
		# @center_x - @width / 2 + padding <= x * @scale <= @center_x + @width / 2 - padding
		# @center_x - @width / 2 / @scale + padding <= x <= @center_x + @width / 2 / @scale - padding
		# @center_x - @width / 2 - padding <= x * @scale <= @center_x + @width / 2 + padding
		@center_x - @width / 2 / @scale - padding <= x <= @center_x + @width / 2 / @scale + padding
	
	# fromWorldX: (x)->
	# fromWorldY: (y)->
	# toWorldX: (x)->
	# toWorldY: (y)->
