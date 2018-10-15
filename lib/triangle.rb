class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && a == c
      return :equilateral
    elsif a == b || a == c || b == c
      return :isosceles
    else
      return :scalene
    end
  end

  def validate_triangle
    real_triangle = [(a + b) > c, (a + c) > b, (b + c) > a, a > 0, b > 0, c > 0]
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
  end
end
