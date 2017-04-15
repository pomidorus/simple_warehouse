require_relative 'command'

class RemoveCrate < Command
  def initialize
    super 'Remove the crate at positon X,Y'
  end

  def execute(args)
    p args.inspect
  end
end
