class CommandParser
  attr_reader :args

  def initialize cmd
    @args = []
    @cmd = cmd
  end

  def parse
    case @cmd
      when /help/
        SimpleWarehouseConstants::HELP_CMD
      when /init\s(.*)\s(.*)/
        @args.push($1.to_i, $2.to_i)
        SimpleWarehouseConstants::INIT_CMD
      when /exit/
        SimpleWarehouseConstants::EXIT_CMD
      else
        'not found'
    end
  end
end
