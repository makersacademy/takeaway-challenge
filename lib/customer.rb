# require './order'
# require './menu'

class Customer

attr_accessor :phone_number, :choices, :total_estimate, :menu

  def initialize phone_number
    @phone_number = phone_number
  end

  def request menu
    @menu = menu.menu_items
  end
  
  def real_total
    choices.inject(0) { |sum, x| sum + menu[x] }
  end

  def validate_order?
   return false if real_total != total_estimate
   true
  end

  def create_order order
    return order if validate_order?
    raise "Wrong total"
  end

end

  # john = Customer.new 78
  # john.choices = ['chicken', 'tuna']
  # puts john.request(Menu.new)
  # john.total_estimate = 11
  # puts john.validate_order?
  # puts john.real_total
  # john.create_order(Order.new(john.choices, john.phone_number))





