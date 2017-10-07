require File.dirname(__FILE__) + '/dish'
class Basket
  DEFAULT_CURENCY = "£"
  
  def initialize (selected_items = {})
    @selected_items = selected_items
  end

  def create_receipt
    receipt = ""
    selected_items.each{ |dish, quantity| receipt << "#{dish.name} - #{DEFAULT_CURENCY}#{'%.2f' % dish.price} x #{quantity}\n"}
    receipt << "Total: #{DEFAULT_CURENCY}#{'%.2f' % calculate_total}"
  end

  def calculate_total
    total = 0
    selected_items.each { |dish, quantity| total += dish.price * quantity }
    total
  end
  
  private
  attr_reader :selected_items

end