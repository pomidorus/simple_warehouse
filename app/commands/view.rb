require_relative 'command'

class View < Command
  def initialize
    super "Show a representation of the current state of the warehouse, marking each position as filled or empty."
  end

  def execute(args)
    # delegation
    f = File.open('warehouse.txt', 'r')
    header = f.readline.strip.split
    (1..header[0].to_i).each do |_|
      puts f.readline
    end
  end
 end
