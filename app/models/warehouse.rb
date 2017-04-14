class Warehouse
  attr_accessor :crates
  attr_reader :width, :height, :positions

  def initialize(args)
    @width = args[0]
    @height = args[1]
    @crates = []
    @positions = []
  end

  def init_positions
    (1..@width).each do |x|
      (1..@height).each do |y|
        @positions << Position.new(x, y)
      end
    end
  end

  def save
    f = File.open('warehouse.txt', 'w')
    f.puts "#{@width} #{@height}"
    f.puts "#{@crates.count}"

    @crates.each do |crate|
      f.puts "#{crate.x} #{crate.y} #{crate.width} #{crate.height} #{crate.name}"
    end

    (1..@height).reverse_each do |y|
      (1..@width).each do |x|
        crate = crates_overlap(Position.new(x,y))
        if crate
          f.write (crate.name)
        else
          f.write ('.')
        end
      end
      f.puts (' ' * @width)
    end

    f.close
  end

  private

  def crates_overlap(position)
    @crates.each do |crate|
      crate.init_positions
      unless (crate.positions & [position]).empty?
        return crate
      end
    end

    nil
  end
end
