module Price

  private

  def update_total(price)
    @total += price
  end

  def correct_price?(item, quantity, price)
    price == self.view_menu[item] * quantity
  end

end
