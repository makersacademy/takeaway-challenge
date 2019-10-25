class TakeAway
  attr_reader :menu, :total_order

  def initialize
    @menu = { "Salmon sushi" => 2.99,
             "Vegetable sushi" => 1.99,
             "Rice" => 1.59,
             "Katsu chicken" => 2.99 }
    @total_order = ""
    @sum_total = 0
  end

  def order(quantity, item)
    @total_order << "#{quantity} x #{item}: £#{quantity * @menu[item]}\n"
  end
end
