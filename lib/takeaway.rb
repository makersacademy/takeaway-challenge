class Takeaway



  def calculate_cost(list_of_dishes)
    total_cost = 0
    list_of_dishes.each do |dish|
      total_cost += dish.price
    end
    total_cost
  end
end
