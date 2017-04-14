class WarehouseReader
  attr_reader :warehouse

  def initialize
    @warehouse = nil
  end

  def read
    f = File.open('warehouse.txt', 'r')
    p warehouse_size = f.readline.strip.split
    p crates_number = f.readline.strip
    f.close

    @warehouse = Warehouse.new([warehouse_size[0].to_i, warehouse_size[1].to_i])
    @warehouse.init_positions
    @warehouse.crates = []
  end
end
