require './app/services/commands_executor'
require './app/services/warehouse_reader'
require './app/services/warehouse_storer'
require './app/commands/show_help_message'
require './app/commands/exit'
require './app/commands/null_command'
require './app/commands/init_warehouse'
require './app/commands/view'
require './app/commands/store_crate'
require './app/commands/locate_product'
require './app/commands/remove_crate'
require './app/simple_warehouse_constants'
require './app/models/warehouse'
require './app/models/crate'
require './app/models/position'

class SimpleWarehouse
  def initialize
    warehouse_reader = WarehouseReader.new
    warehouse_storer = WarehouseStorer.new
    @cmd_executor = CommandsExecutor.new(NullCommand.new)
    @cmd_executor.add_command SimpleWarehouseConstants::HELP_CMD, ShowHelpMessage.new
    @cmd_executor.add_command SimpleWarehouseConstants::INIT_CMD, InitWarehouse.new
    @cmd_executor.add_command SimpleWarehouseConstants::STORE_CMD, StoreCrate.new(warehouse_reader, warehouse_storer)

    @cmd_executor.add_command SimpleWarehouseConstants::LOCATE_CMD, LocateProduct.new
    @cmd_executor.add_command SimpleWarehouseConstants::REMOVE_CMD, RemoveCrate.new

    @cmd_executor.add_command SimpleWarehouseConstants::VIEW_CMD, View.new
    @cmd_executor.add_command SimpleWarehouseConstants::EXIT_CMD, Exit.new
  end

  def run
    puts SimpleWarehouseConstants::INVITATION
    while true
      print '> '
      parser = CommandParser.new(get_command)
      @cmd_executor.execute(parser)
    end
  end

  private

  def get_command
    gets.chomp
  end
end
