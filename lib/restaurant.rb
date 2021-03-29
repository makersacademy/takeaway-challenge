class Restaurant

  attr_reader :restaurant_menu, :menu, :basket

  def initialize(name = 'name', text_message = TextMessage.new)
    @name = name
    @restaurant_menu = []
    @basket = Basket.new
    @text = text_message
  end

  def create_menu(name)
    @menu = Menu.new(name)
    save_menu
  end

  def save_menu
    @restaurant_menu << @menu
  end

  def add_item_to_menu(index, item_name, item_price, item_describtion)
    @restaurant_menu[index].add_item(item_name, item_price, item_describtion)
  end

  def change_item(menu_index, item_index, name: nil, price: nil, description: nil)
    @restaurant_menu[menu_index].change_item_name(item_index, name) if :name
    @restaurant_menu[menu_index].change_item_price(item_index, price) if :price
    @restaurant_menu[menu_index].change_item_description(item_index, description) if :description
  end

  def delete_item_from_menu(menu_index, item_index)
    @restaurant_menu[menu_index].delete_item(item_index)
  end

  def delete_menu(name)
    @restaurant_menu.delete(name)
    @restaurant_menu
  end

  def print_restaurant_menu
    @restaurant_menu.map { |menu|
      "#{menu.name} \n#{menu.print_menu}"
    }
  end

  def select_item(menu_index, item_index)
    item = @restaurant_menu[menu_index].menu[item_index]
    @basket.add_(item)
  end

  def remove_selected_item(item_index)
    @basket.remove_(item_index)
  end

  def print_basket
    @basket.print_basket
  end

  def check_out(to)
    send_text_message(to)
    @basket.empty_basket
  end

  private

  def send_text_message(to)
    @text.send_text_message(to)
  end
end
