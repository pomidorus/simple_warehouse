require_relative 'command'

class Exit < Command
  def initialize
    super 'Exits the application'
  end

  def execute(args)
    puts 'Thank you for using simple_warehouse!'
    exit
  end
end
