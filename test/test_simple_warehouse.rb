require_relative 'test_helper'
require './app/simple_warehouse'

class TestSimpleWarehouse < Minitest::Test
  def setup
    @application = TestSimpleWarehouse.new
  end
end
