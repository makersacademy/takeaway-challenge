# Menu contains dishes and their corresponding prices
class Menu

  attr_reader :menu

  def initialize
    @menu = [ { name: "prawns", price: 5    },
              { name: "wood", price: 10     },
              { name: "fire", price: 15     },
              { name: "wet", price: 10      },
              { name: "taco", price: 3      }          
            ]
  end 
  
  def print_menu
    @menu.each do |dish|
      puts "#{dish[:name]} ------ #{dish[:price]}"
    end
  end

end
