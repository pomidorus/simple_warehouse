require_relative '../test_helper'

describe Crate do
  before do
    args = [1, 1, 2, 2, 'A']
    @crate = Crate.new(args)
  end

  describe '#initialize' do
    it 'Crate class instance' do
      @crate.must_be_instance_of(Crate)
    end

    it 'contains correct values' do
      assert_equal(1, @crate.x)
      assert_equal(1, @crate.y)
      assert_equal(2, @crate.width)
      assert_equal(2, @crate.height)
      assert_equal('A', @crate.name)
    end

    it 'contains valid positions' do
      assert_equal(4, @crate.positions.count)

      assert_equal(Position.new(1,1), @crate.positions[0])
      assert_equal(Position.new(1,2), @crate.positions[1])
      assert_equal(Position.new(2,1), @crate.positions[2])
      assert_equal(Position.new(2,2), @crate.positions[3])
    end
  end
end
