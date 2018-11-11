class Menu

  DISH_LIST = {
          'chicken korma' => 5.70,
          'chicken bhuna' => 6.70,
          'lamb rogan josh' => 6.50,
          'lamb madras' => 5.80,
          'king prawn dhansak' => 7.70,
          'plain rice' => 1.90,
          'pilau rice' => 2.00,
          'bombay aloo' => 3.25,
          'tarka daal' => 3.25,
          'plain naan' => 2.50,
          'garlic naan' => 2.75,
          'peshwari naan' => 3.00
        }

  attr_reader :list, :selection

  def initialize(list = DISH_LIST)
    @list = list
    @selection = []
  end

  def select_item(item)
    price = @list[item]
    @selection << [item, price]
  end

end
