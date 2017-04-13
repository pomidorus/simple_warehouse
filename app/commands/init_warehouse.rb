require_relative 'command'

class InitWarehouse < Command
  def initialize
    super '(Re)Initialises the application as a W x H warehouse, with all spaces empty.'
  end

  def execute(args)
    p args
  end
end
