require_relative '../test_helper'

describe WarehouseRemover do
  before do
    @warehouse_remover = WarehouseRemover.new
    @crate = Crate.new([1, 1, 2, 2, 'A'])
    @warehouse = Warehouse.new([10, 10])
    @warehouse.crates << @crate
  end

  describe '#remove' do
    it 'removes crate from warehouse' do
      @warehouse_remover.remove(@warehouse, Position.new(1,1))
      assert_equal([], @warehouse.crates)
    end

    it 'do not removes crate from warehouse' do
      @warehouse_remover.remove(@warehouse, Position.new(5,5))
      assert_equal([@crate], @warehouse.crates)
    end

    it 'returns message to the user if crate do not exists in this position' do
      assert_output(/There is no any crate at this position/) { @warehouse_remover.remove(@warehouse, Position.new(5,5)) }
    end
  end
end
