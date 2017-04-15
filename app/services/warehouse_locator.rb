class WarehouseLocator
  def locate(warehouse, name)
    crates = warehouse.find_crates_by_name(name)
    crates.each do |crate|
      puts crate.to_s
    end
  end
end
