class PriceList
  def initialize
    @order = []
    @total = 0
  end

  PRICE_LIST = {
    "Chicken Korma"         => 5,
    "Chicken Dhansak"       => 5,
    "Chicken Tikka Masala"  => 6,
    "Chicken Madras"        => 6,
    "Plain Rice"            => 2,
    "Pilau Rice"            => 3,
    "Keema Rice"            => 3,
    "Egg Fried Rice"        => 2.50
  }

  def display_price_list
    PRICE_LIST.dup
  end

  def select_item(item, amount)
    @order << {item => amount}
  end

  def list_selection
    @order.dup
  end

  def calculate_total
    @order.each do | dish |
      dish.each_pair do | order, amount |
        if PRICE_LIST.include?(order)
          @total += PRICE_LIST[order]*amount
        end
      end
    end
  end

  def order_total
    total = @total
    total
  end

  def place_order
    "Thank you for your order!\n You have ordered: #{self.list_selection}\n Which comes to a total of £#{self.order_total}."
  end
end
