require_relative 'message_sender'
class Restaurant

  attr_accessor :menu, :order, :total_amount, :text_is_sent

  def initialize
    @menu = {
      :Beef_BBQ => 15,
      :Chicken_Supreme => 16,
      :Hawaiian => 14,
      :Margherita => 12,
      :Pepperoni => 16,
      :Texan_BBQ => 15,
      :Tuna_Sweetcorn => 17,
      :Vegetable => 16
      }
      @order = []
      @total_amount = 0
      @text_is_sent = Message_sender.new
    end

    def dishes_can_be_selected dish, quantity
    quantity.times do
      order << menu.select {|x,y| x == dish}
    end
  end

    def give_total_amount
    total_amount = order.map{|item| item.values}.flatten.inject{|sum,x| sum + x }
    return total_amount
  end

  def text_message_is_send
    text_is_sent.message
  end
end