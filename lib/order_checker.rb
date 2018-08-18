module OrderChecker

  def self.check_order(menu, order_array)
    raise "Invalid dish selection!" unless valid_order?(menu, order_array)
    calculated_total(menu, order_array)
  end

  def self.valid_order?(menu, order_array)
    order_array.each { |item|
      return false if item[0] >= (menu.length + 1)
     }
    true
  end

  def self.calculated_total(menu, order_array)
    total = 0
    order_array.each do | order |
      total += menu[order[0] - 1][:price] * order[1]
    end
    total
  end

end
