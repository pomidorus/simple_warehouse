class CommandsExecutor
  attr_reader :commands

  def initialize
    @commands = {}
  end

  def add_command(cmd, cmd_object)
    @commands[cmd] = cmd_object
  end

  def execute(cmd)
    cmd_object = @commands[cmd] || NullCommand.new
    cmd_object.execute
  end
end
