# It is responsible for showing dishes and their prices

class Menu

  attr_reader :pizza, :pasta

  def initialize
    # @pizza = {}
    # @pasta = {}
  end

  def view_menu
    { :pizza_dishes => pizza_dishes, :pasta_dishes => pasta_dishes }
  end

  def pizza_dishes
    @pizza = { :margherita => 9.50,
              :fiorentina => 11.95,
              :rustica => 11.95,
              :diavolo => 12.45
            }
  end

  def pasta_dishes
    @pasta = { :spaghetti => 10.00,
            :lasagne => 9.95,
            :vegetarian_lasagne => 6.50
          }
  end

end
