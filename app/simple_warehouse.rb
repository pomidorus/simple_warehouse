class SimpleWarehouse
  INVITATION = 'Type `help` for instructions on usage'
  HELP_CMD = 'help'
  EXIT_CMD = 'exit'

  def initialize
    @live = true
    @cmd_executor = CommandsExecutor.new
    @cmd_executor.add_command HELP_CMD, ShowHelpMessage.new()
    @cmd_executor.add_command EXIT_CMD, Exit.new()
  end

  def run
    puts INVITATION
    while @live
      print '> '
      command = get_command
      @cmd_executor.execute(command)
    end
  end

  private

  def get_command
    gets.chomp
  end

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end

  def exit
    puts 'Thank you for using simple_warehouse!'
    @live = false
  end
end
