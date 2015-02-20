
tolerance = 0.00001

def compose(f, g):
  def temp(x):
    return f(g(x))
  return temp

def average(x, y):
  return (x + y) / 2

def repeat(f, n):
  def iter_repeat(com, c):
    if c < n:
      return iter_repeat(compose(com, f), c+1)
    else:
      return com
  return iter_repeat(f, 0)

def fixed_point(f, first_guess):

  def close_enough(v1, v2):
    return abs(v1-v2) < tolerance

  def try_iter(guess):
    nex = f(guess)
    if close_enough(guess, nex):
      return nex
    else:
      return try_iter(nex)

  return try_iter(first_guess)

def average_damp(f):
  def temp(x):
    return (x + f(x)) / 2
  return temp

def nested_average_damp(n):
  return repeat(average_damp, n)


def sqrt(x):
  def xyz(y):
    return x / y
  return fixed_point(average_damp(xyz), 1.0)

def eighth_root(x):
  def tmp(y):
    return x / (y**7)
  return fixed_point(nested_average_damp(3)(tmp), 1.0 )

print sqrt(4)
print eighth_root(256)
