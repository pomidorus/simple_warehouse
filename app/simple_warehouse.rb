require './app/services/commands_executor'
require './app/commands/show_help_message'
require './app/commands/exit'
require './app/commands/null_command'

class SimpleWarehouse
  INVITATION = 'Type `help` for instructions on usage'
  HELP_CMD = 'help'
  EXIT_CMD = 'exit'

  def initialize
    @cmd_executor = CommandsExecutor.new
    @cmd_executor.add_command HELP_CMD, ShowHelpMessage.new
    @cmd_executor.add_command EXIT_CMD, Exit.new
  end

  def run
    puts INVITATION
    while true
      print '> '
      command = get_command
      @cmd_executor.execute(command)
    end
  end

  private

  def get_command
    gets.chomp
  end
end
