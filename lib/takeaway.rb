class Takeaway

  DEFAULT_MENU = { fish: 600, chips: 200, peas: 100 }

  def initialize(initial_menu = DEFAULT_MENU)
    @menu = initial_menu
    @selection = Hash.new(0)
  end

  def present_menu
    return "Sorry – no items on the menu today" if menu.empty?
    menu.map { |d, p| "#{d.to_s.capitalize}: #{pounded(p)}" }.join(', ')
  end

  def select_item(dish, quantity = 1)
    selection[dish] = quantity
    selection.delete(dish) if quantity == 0
    "Selected #{quantity} #{dish}"
  end

  def present_selection
    return "You haven't selected anything" if selection.empty?
    selection.map { |d, n| "#{d.to_s.capitalize}: #{n}" }.join(', ')
  end

  def present_total
    "Your order costs #{pounded(tot_up)}"
  end

  def place_order(payment)
    error = "Payment of #{pounded(payment)} for order of #{pounded(tot_up)}"
    fail error if payment != tot_up
    "Your order of #{pounded(payment)} is accepted"
  end

  private

  attr_reader :menu
  attr_accessor :selection

  def tot_up
    return 0 if selection.empty?
    selection.map { |dish, _n| selection[dish] * menu[dish] }.inject(:+)
  end

  def pounded(pennies)
    "£#{pennies / 100}.#{format('%02i', pennies % 100)}"
  end

end
