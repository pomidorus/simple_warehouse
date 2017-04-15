class WarehouseRemover
  def remove(warehouse, position)
    crates = warehouse.crates
    crates.each do |crate|
      unless (crate.positions & [position]).empty?
        warehouse.crates.delete(crate)
        puts "Crate #{crate.name} removed from the warehouse"
      end
    end

    if crates == warehouse.crates
      puts "There is no any crate at this position"
    end

    warehouse.save
  end
end
