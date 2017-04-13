require_relative 'command'

class InitWarehouse < Command
  def initialize
    super '(Re)Initialises the application as a W x H warehouse, with all spaces empty.'
  end

  def execute(args)
    warehouse = Warehouse.new(args)
    warehouse.save
    puts "New warehouse of width: #{args[0]} and height: #{args[1]} created"
  end
end
