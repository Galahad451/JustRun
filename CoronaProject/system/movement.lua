local movement = {}

function movement.breath( object, intensity, time )

	intensity = 1 - ( intensity )
	time = time or 250
	local w, h, i, e = object.width, object.height, {}, {}
	local function inhale() transition.to( object, i ) end
	local function exhale() transition.to( object, e ) end

	-- Set transitions
	i = { time = time, width = w * intensity, height = h * intensity, transtion = easing.inOutQuad, onComplete = exhale }
	e = { time = time, width = w / intensity, height = h / intensity, transtion = easing.inOutQuad, onComplete = inhale }

	inhale()
end

function movement.shake( object, intensity, time )
	intensity = 1 - ( intensity )
	time = time or 250
	local w, h, i, e = object.width, object.height, {}, {}
	local function start( ) transition.to( object, i ) end
	local function shakeEnd() transition.to( object, e ) end

	-- Set transitions
	i = { time = time, width = w * intensity, height = h * intensity, transition = easing.inOutQuad, onComplete = shakeEnd }
	e = { time = time, width = w * intensity, height = h * intensity, transition = easing.inOutQuad, onComplete = shakeEnd }

	start()
end

return movement