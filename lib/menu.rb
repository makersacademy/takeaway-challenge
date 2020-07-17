class Menu

  MENU = {
      1 => { curry: 4.00 },
      2 => { chicken: 3.00 },
      3 => { chips: 1.00 },
      4 => { rice: 2.00 }
  }

  def display
    puts "TAKEAWAY MENU: "
    MENU.each_pair { |id, item|
      item.map { |food, price|
        puts "#{id}: #{food.capitalize} -> £#{'%.2f' % price}"
      }
    }
  end

  def options
    MENU
  end

end
