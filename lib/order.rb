require_relative 'dish_list'
require 'twilio-ruby'

class Order

  attr_reader :dish_list, :dishes_ordered

  def initialize
    @dish_list = DishList.new
    @dishes_ordered = []
  end

  def show_list_of_all_dishes
    @dish_list.all_dishes
  end

  def start_new_order
    @dish_list.new_order
  end

  def finish_order(phone_number)
    text = Text.new
    text.send_confirmation_text(phone_number)
  end
end
