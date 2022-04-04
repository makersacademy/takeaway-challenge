class Menu
attr_reader :dishes
    def initialize
        @dishes = { 
    "fries" => 2,
    "shawarma" => 6,
    "Hummus" => 3,
    "Falafel" => 5,
    "Rice" => 6,
    }
    end

  def display_menu
    @dishes.each { |name, price| puts "#{name} £#{price}" }
  end
    
  
end