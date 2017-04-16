require_relative '../test_helper'

describe Warehouse do
  before do
    args = [2, 3]
    @warehouse = Warehouse.new(args)
  end

  describe '#initialize' do
    it 'contains correct values' do
      assert_equal(2, @warehouse.width)
      assert_equal(3, @warehouse.height)
      assert_equal([], @warehouse.crates)
    end

    it 'contains valid positions' do
      assert_equal(6, @warehouse.positions.count)

      assert_equal(Position.new(1,1), @warehouse.positions[0])
      assert_equal(Position.new(1,2), @warehouse.positions[1])
      assert_equal(Position.new(1,3), @warehouse.positions[2])
      assert_equal(Position.new(2,1), @warehouse.positions[3])
      assert_equal(Position.new(2,2), @warehouse.positions[4])
      assert_equal(Position.new(2,3), @warehouse.positions[5])
    end
  end

  describe '#find_crates_by_name' do
    before do
      @crate = Crate.new([1, 1, 2, 2, 'A'])
      @warehouse.crates << @crate
    end

    it 'returns valid crate' do
      assert_equal([@crate], @warehouse.find_crates_by_name('A'))
    end
  end
end
