require_relative 'command'

class LocateProduct < Command
  def initialize
    super 'Show a list of positions where product number can be found'
  end

  def execute(args)
    p args.inspect
  end
end
