class Warehouse
  def initialize(args)
    @width = args[0]
    @height = args[1]
  end

  def save
    f = File.open('warehouse.txt', 'w')
    f.puts "#{@width} #{@height}"
    (1..@height).each do |_|
      f.puts ('.' * @width)
    end
    f.close
  end
end
