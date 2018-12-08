class TakeAway
  attr_reader :dish, :dish_name, :selected_dishes

  def initialize
    @dish = {
    'fried chicken' => 7.00,
    'plain rice' => 2.00,
    'steamed vegetables' => 4.50,
    }
  end

  def list
    @dish.map do |key, value|
      "#{key} - £ #{value}"
    end
  end

  def select_dishes(*dish_name)
  
  end

end
