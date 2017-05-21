# It is responsible for showing dishes and their prices

class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = { :pizza => { :margherita => 9.50,
                              :fiorentina => 11.95,
                              :rustica => 11.95,
                              :diavolo => 12.45
                              },
                    :pasta => { :spaghetti => 10.00,
                              :lasagne => 9.95,
                              :vegetarian_lasagne => 6.50
                              }
                  }
  end

  def view_menu
    @menu_items.each do |style_of_food, dishes|
      p "#{style_of_food}:"
      dishes.each { |dish, price| p "#{dish} - £#{price}" }
    end
  end

  def confirm_menu_item(menu_item_key)
    build_menu_items_to_check
    raise 'Item not in menu!' unless @check_items.include?(menu_item_key)
  end

  private

  def build_menu_items_to_check
    @check_items = []
    @menu_items.each do |_style_of_food, dishes|
      dishes.each do |dish|
        @check_items << dish[0]
      end
    end
  end


end
