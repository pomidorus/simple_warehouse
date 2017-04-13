require_relative 'command_parser'

class CommandsExecutor
  attr_reader :commands

  def initialize
    @commands = {}
  end

  def add_command(cmd, cmd_object)
    @commands[cmd] = cmd_object
  end

  def execute(cmd)
    parser = CommandParser.new(cmd)
    cmd_object = @commands[parser.parse] || NullCommand.new
    cmd_object.execute(parser.args)
  end
end
