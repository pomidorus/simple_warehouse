class WarehouseViewer
  def view
    f = File.open('warehouse.txt', 'r')

    header = f.readline.strip.split

    crates_number = f.readline.strip.to_i
    (1..crates_number).each do |_|
      f.readline
    end

    (1..header[0].to_i).each do |_|
      puts f.readline
    end

    f.close
  end
end
