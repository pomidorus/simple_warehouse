require_relative '../test_helper'

class TestCommandsExecutor < Minitest::Test
  def setup
    @cmds_executor = CommandsExecutor.new(NullCommand.new)
  end

  def test_that_executor_adds_commands
    @cmds_executor.add_command('help', ShowHelpMessage.new)
    assert_equal 1, @cmds_executor.commands.count
  end
end
