class Menu

  attr_reader :menu

  def initialize
      @title = "chinese delivery"
      @menu = {
        1 => { "Won Ton Soup"  =>  8 },
        2 => { "Chilli Chicken" => 6 },
        3 => { "Egg Rolls"  =>  5 },
        4 => { "Fried Rice"  =>  3 },
        5 => { "Prawn Crackers" => 1 }
      }
  end

  def list
    menu_string = ""
    @menu.each do |number,dish|
       dish.each do |dish,price|
        menu_string << ("#{number} : #{dish} = #{price}" + "\n")
        end
      end
      return menu_string
  end


end
