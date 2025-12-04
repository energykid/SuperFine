function lerp(x, y, z)
  return x + ((y - x) * z)
end

function floor(x)
  return x - (x % 1)
end

function vec2(_x, _y)
  return {
    x = _x,
    y = _y,
  }
end