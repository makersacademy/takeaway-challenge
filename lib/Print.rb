class Print

  def print_dishes(dishes)
    dishes.each do |k,v|
       puts "Dish: #{k}, Price: £#{v}"
    end
  end

end
