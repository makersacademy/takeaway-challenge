class Restaurant

  def take_order(order, payment, person)

    if payment < order.total
      puts "not enough grade"
    else
      "cheers"
    end

  end

end