class Menu

  attr_reader :items

  def initialize 

    @items = {
      "special fried rice" => 4.00,
      "wonton soup"        => 3.00,
      "crispy seaweed"     => 3.50,
      "peking duck"        => 8.50,
      "spare ribs"         => 6.00,
      "sesame prawn toast" => 3.50,
      "chicken chow mein"  => 5.50,
      "spring roll"        => 7.00,
    }

  end

  def print

    items.each do |k, v| 
      puts "#{k}: £#{v}"  
    end

  end

end
