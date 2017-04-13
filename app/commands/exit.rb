require_relative 'command'

class Exit < Command
  def initialize
    super 'Exits the application'
  end

  def execute
    exit
  end
end
