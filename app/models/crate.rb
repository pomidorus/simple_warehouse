class Crate
  attr_accessor :x, :y, :width, :height, :name
  attr_reader :positions

  def initialize(args)
    @x = args[0].to_i
    @y = args[1].to_i
    @width = args[2].to_i
    @height = args[3].to_i
    @name = args[4]
    @positions = []
  end

  def init_positions
    (0..(@width - 1)).each do |x|
      (0..(@height - 1)).each do |y|
        @positions << Position.new(x + @x, y + @y)
      end
    end
  end
end
