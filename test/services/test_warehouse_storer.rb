require_relative '../test_helper'

describe WarehouseStorer do
  before do
    @warehouse_storer = WarehouseStorer.new
    @crate = Crate.new([1, 1, 2, 2, 'A'])
    @crate_2 = Crate.new([3, 3, 2, 2, 'B'])
    @crate_3 = Crate.new([8, 8, 5, 5, 'C'])
    @crate_4 = Crate.new([3, 3, 3, 3, 'D'])
    @warehouse = Warehouse.new([10, 10])
    @warehouse.crates << @crate_2
  end

  describe '#store' do
    it 'stores a new crate' do
      @warehouse_storer.store(@warehouse, @crate)
      assert_equal([@crate_2, @crate], @warehouse.crates)
    end

    it 'do not store crate - not fit to the warehouse' do
      @warehouse_storer.store(@warehouse, @crate_3)
      assert_equal([@crate_2], @warehouse.crates)
    end

    it 'do not store crate - overlap with existing crate' do
      @warehouse_storer.store(@warehouse, @crate_4)
      assert_equal([@crate_2], @warehouse.crates)
    end
  end
end
