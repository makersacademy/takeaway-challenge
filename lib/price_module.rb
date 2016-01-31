module Price

  PRICE_ERROR = "Incorrect price, order rejected".freeze

  private

  def update_total(price)
    @total += price
  end

  def correct_price?(item, quantity, price)
    price == self.view_menu[item] * quantity
  end

end
