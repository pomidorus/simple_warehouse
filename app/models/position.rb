class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def hash
    @x.hash + @y.hash
  end

  def eql?(other)
    (@x == other.x) && (@y == other.y)
  end

  def ==(other)
    (@x == other.x) && (@y == other.y)
  end
end
