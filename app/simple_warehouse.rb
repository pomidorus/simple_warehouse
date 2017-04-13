class SimpleWarehouse
  INVITATION = 'Type `help` for instructions on usage'
  HELP_CMD = 'help'

  def initialize
    @cmd_executor = CommandsExecutor.new
    @cmd_executor.add_command HELP_CMD, ShowHelpMessage.new()
  end

  def run
    @live = true
    puts INVITATION
    while @live
      print '> '
      command = get_command
      @cmd_executor.execute(command)
      # case command
      #   when 'help'
      #     show_help_message
      #   when 'exit'
      #     exit
      #   else
      #     show_unrecognized_message
      # end
    end
  end

  def get_command
    gets.chomp
  end

  private

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end

  def exit
    puts 'Thank you for using simple_warehouse!'
    @live = false
  end
end
