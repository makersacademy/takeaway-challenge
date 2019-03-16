class Takeaway  
  attr_reader :price_list

  def show_menu
    @list = {'chicken curry' => 6,
            'veg rice' => 5,
            'chicken burger' => 4,
            'quarter ponder' => 6,
            'chicken wrap' => 5,
            'chips' => 2,
            'bbq wings' => 5,
            'spicy wings' => 4
            }
  end
end