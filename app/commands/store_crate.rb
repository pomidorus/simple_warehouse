require_relative 'command'

class StoreCrate < Command
  def initialize
    super "Stores a crate of product number P and of size W x H at position X,Y"
  end

  def execute(args)
    warehouse =  WarehouseReader.read
    WarehouseStorer.new(warehouse).store(args)
  end
end
