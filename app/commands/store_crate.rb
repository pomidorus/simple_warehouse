require_relative 'command'

class StoreCrate < Command
  def initialize(warehouse_reader, warehouse_storer)
    super "Stores a crate of product number P and of size W x H at position X,Y"
    @warehouse_reader = warehouse_reader
    @warehouse_storer = warehouse_storer
  end

  def execute(args)
    @warehouse_reader.read
    @warehouse_storer.store(@warehouse_reader.warehouse, args)
  end
end
