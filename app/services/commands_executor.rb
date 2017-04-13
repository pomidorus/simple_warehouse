class CommandsExecutor
  attr_reader :commands

  def initialize
    @commands = {}
  end

  def add_command(cmd, cmd_object)
    @commands[cmd] = cmd_object
  end

  def execute(cmd)
    @commands[cmd].execute
  end
end
