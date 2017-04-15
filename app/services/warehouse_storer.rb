class WarehouseStorer
  def store(warehouse, crate)
    @warehouse = warehouse

    if validate(crate)
      @warehouse.crates << crate
      @warehouse.save
      puts "New crate of width: #{crate.width} and height: #{crate.height} created"
    end
  end

  private

  def validate(crate)
    unless overlap?(crate)
      puts "Cannot store crate: position doesn't exist or crate does not fit"
      return false
    end

    if crates_overlap?(crate)
      puts "Cannot store crate: crate overlap existing crate"
      return false
    end

    true
  end

  def overlap?(crate)
    (@warehouse.positions & crate.positions) == crate.positions
  end

  def crates_overlap?(crate)
    crate_overlap = []

    @warehouse.crates.each do |warehouse_crate|
      crate_overlap << !((warehouse_crate.positions & crate.positions).empty?)
    end

    crate_overlap.any?
  end
end
