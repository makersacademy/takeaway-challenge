# Menu contains dishes and their corresponding prices
class Menu

  attr_reader :menu

  def initialize
    @menu = [{ name: "prawns", price: 5.25   },
              { name: "wood", price: 13.00   },
              { name: "fire", price: 15.00   },
              { name: "wet", price: 10.05    },
              { name: "taco", price: 3.99    },
              { name: "meat", price: 1.25    }           
            ]
  end 
  
  def print
    @menu.each do |dish|
      puts "#{dish[:name]} ------ £#{dish[:price]}"
    end
  end
end
