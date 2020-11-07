class Menu

attr_reader :falafel_menu

def initialize
  @falafel_menu = {"Veggi Wrap" => 5.50,
                    "Lamb Wrap" => 6.50,
                    "Hummus" => 2.50,
                    "Fizzy Drink" => 1.50,
                    "Water" => 1.00
                  }
end

  def view
    print_header
    linewidth = 25
    @falafel_menu.each do |item, price|
      puts ("#{item}:").ljust(linewidth/2) + ("£#{"%.2f" % price}").rjust(linewidth/2)
    end
  end

  private
  
  def print_header
    puts "-------------------------"
    puts "Falafel Menu".center(25)
    puts "-------------------------"
  end

end