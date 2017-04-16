require_relative '../test_helper'

describe CommandParser do
  before do
    @command_parser = CommandParser.new('init 1 2')
  end

  describe '#parse' do
    it 'returns valid command and args' do
      assert_equal('init', @command_parser.parse)
      assert_equal([1, 2], @command_parser.args)
    end
  end
end
