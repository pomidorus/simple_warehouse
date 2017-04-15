require_relative 'command'

class LocateProduct < Command
  def initialize(warehouse_reader, warehouse_locator)
    super 'Show a list of positions where product number can be found'
    @warehouse_reader = warehouse_reader
    @warehouse_locator = warehouse_locator
  end

  def execute(args)
    @warehouse_reader.read
    @warehouse_locator.locate(@warehouse_reader.warehouse, args[0])
  end
end
