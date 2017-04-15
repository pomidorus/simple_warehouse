require_relative 'command_parser'

class CommandsExecutor
  attr_reader :commands

  def initialize(null_cmd)
    @commands = {}
    @null_cmd = null_cmd
  end

  def add_command(cmd, cmd_object)
    @commands[cmd] = cmd_object
  end

  def execute(parser)
    cmd_object = @commands[parser.parse] || @null_cmd
    cmd_object.execute(parser.args)
  end
end
