function lerp(x, y, z)
  return x + ((y - x) * z)
end

function floor(x)
  return x - (x % 1)
end