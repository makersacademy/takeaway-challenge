class Takeaway

  def dish_list
    @dish_list = {
      sandwich:   5,
      pasta:      7.5, 
      salad:      6,
      coke:       1
    }
  end

  def check_order(order, total)
    bill = order.map { |dish| dish_list[dish] }.inject(:+)
    if bill == total
      true
    else
      raise "sum is incorrect"
    end
  end

end