require_relative 'command'

class RemoveCrate < Command
  def initialize(warehouse_reader, warehouse_remover)
    super 'Remove the crate at positon X,Y'
    @warehouse_reader = warehouse_reader
    @warehouse_remover = warehouse_remover
  end

  def execute(args)
    @warehouse_reader.read
    @warehouse_remover.remove(@warehouse_reader.warehouse, Position.new(args[0], args[1]))
  end
end
