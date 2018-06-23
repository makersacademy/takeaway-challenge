class Takeaway
  def show_menu
    { dosa: '£6', curry: '£12' }
  end

  def order(dish, amount = 1)
    "#{amount} x #{dish}"
  end
end
