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

end
