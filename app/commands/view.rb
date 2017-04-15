require_relative 'command'

class View < Command
  def initialize(warehouse_viewer)
    super "Show a representation of the current state of the warehouse, marking each position as filled or empty."
    @warehouse_viewer = warehouse_viewer
  end

  def execute(args)
    @warehouse_viewer.view
  end
 end
