require_relative 'dish'
require_relative 'dish_printer'
require_relative 'send_sms'

class Menu
  attr_reader :dishes, :selection, :menuprinter, :send_sms
  DISHES = [['Tagliatelle with duck ragu', 9], ['Pizza Diavola', 10], ['Salad Caprese', 8.5]]
  def initialize(send_sms_class = SendSms)
    @dishes = DISHES.map { | name_price | Dish.new name_price[0], name_price[1] }
    @selection = []
    @menuprinter = DishPrinter
    @send_sms = send_sms_class.new
    puts menuprinter.see_menu dishes
  end
  def select dish_name, quantity
    matches = dishes.select { |dish| dish_name == dish.name }
    matches.length > 0 ? matches.each { |match| make_selection match, quantity } : 'Sorry, that is not available'
  end

  def check_order customer_total
    raise "Sorry, our sums do not match" if customer_total != menuprinter.get_total(selection)
    @send_sms.send
    menuprinter.see_order(selection) + menuprinter.see_total(selection)
  end
  private

  def make_selection match, quantity
    match.quantity_ordered += quantity
    selection << match
  end
end
