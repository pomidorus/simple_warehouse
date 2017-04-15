class WarehouseReader
  attr_reader :warehouse

  def initialize
    @warehouse = nil
  end

  def read
    f = File.open('warehouse.txt', 'r')

    warehouse_size = f.readline.strip.split
    @warehouse = Warehouse.new([warehouse_size[0].to_i, warehouse_size[1].to_i])

    crates_number = f.readline.strip.to_i
    (1..crates_number).each do |_|
      crate = Crate.new(f.readline.strip.split)
      @warehouse.crates << crate
    end

    f.close
  end
end
