class Menu

  attr_reader :items

  def initialize 

    @items = {
      "special fried rice" => 4.00,
      "wonton soup"        => 3.00,
      "crispy seaweed"     => 3.50
    }

  end

  def print

    items.each do |k, v| 
      puts "#{k}: £#{v}"  
    end

  end

end
