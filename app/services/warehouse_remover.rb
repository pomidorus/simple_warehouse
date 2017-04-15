class WarehouseRemover
  def remove(warehouse, position)
    @warehouse = warehouse
    @crates = warehouse.crates

    if delete_crate?(position)
      @warehouse.save
    else
      puts 'There is no any crate at this position'
    end
  end

  private

  def delete_crate?(position)
    @crates.each do |crate|
      unless (crate.positions & [position]).empty?
        @warehouse.crates.delete(crate)
        puts "Crate #{crate.name} removed from the warehouse"
        return true
      end
    end

    false
  end
end
