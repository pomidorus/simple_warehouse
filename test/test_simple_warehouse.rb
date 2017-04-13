require_relative 'test_helper'

class TestSimpleWarehouse < Minitest::Test
  def setup
    @application = SimpleWarehouse.new
  end
end
