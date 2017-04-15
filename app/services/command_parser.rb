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
      when /init\s(\d+)\s(\d+)/
        @args.push($1.to_i, $2.to_i)
        SimpleWarehouseConstants::INIT_CMD
      when /store\s(\d+)\s(\d+)\s(\d+)\s(\d+)\s(\w)/
        @args.push($1.to_i, $2.to_i, $3.to_i, $4.to_i, $5)
        SimpleWarehouseConstants::STORE_CMD
      when /locate\s(\w)/
        @args.push($1)
        SimpleWarehouseConstants::LOCATE_CMD
      when /remove\s(\d+)\s(\d+)/
        @args.push($1.to_i, $2.to_i)
        SimpleWarehouseConstants::REMOVE_CMD
      when /view/
        SimpleWarehouseConstants::VIEW_CMD
      when /exit/
        SimpleWarehouseConstants::EXIT_CMD
      else
        'not found'
    end
  end
end
