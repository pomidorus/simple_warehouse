class Warehouse
  attr_accessor :crates
  attr_reader :width, :height, :positions

  def initialize(args)
    @width = args[0]
    @height = args[1]
    @crates = []
    @positions = []

    init_positions
  end

  def find_crates_by_name(name)
    @crates.select {|crate| crate.name == name}
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

  def init_positions
    (1..@width).each do |x|
      (1..@height).each do |y|
        @positions << Position.new(x, y)
      end
    end
  end

  def crates_overlap(position)
    @crates.each do |crate|
      unless (crate.positions & [position]).empty?
        return crate
      end
    end

    nil
  end
end
