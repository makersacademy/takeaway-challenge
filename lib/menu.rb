# Menu contains dishes and their corresponding prices
class Menu

  attr_reader :menu

  def initialize
    @menu = [{ name: "prawns", price: 5   },
              { name: "wood", price: 13   },
              { name: "fire", price: 15   },
              { name: "wet", price: 10    },
              { name: "taco", price: 3    },
              { name: "meat", price: 1    }           
            ]
  end 
  
  def print_menu
    @menu.each do |dish|
      puts "#{dish[:name]} ------ #{dish[:price]}"
    end
  end

end
