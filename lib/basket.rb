class Basket
  attr_accessor :basket, :balance

  def initialize
    @basket = []
    @balance = 0
  end

  def add_item(item)
    Menu::MENU.each do |menu_item|
      menu_item.each do |key, value|
        if value.is_a?(String)
          if value.include?(item)
            @basket << menu_item[:item]
            @balance += menu_item[:price]
            break
          end
        end
      end
    end
  end

  def view_basket
    @basket
  end

  def check_total
    "Order: #{@basket} /n Total: £#{@balance}0"
  end
end
