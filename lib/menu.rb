class Menu 
  def initialize
    @order = []
    @menu_hash = {
      "kung po chicken" => 7,
      "crispy chilli beef" => 9,
      "crispy duck pancakes" => 8,
      "crispy seaweed" => 2,
      "spare ribs" => 5,
      "egg fired rice" => 4,
      "chow mein" => 6
    }
  end

  def view_menu
    @menu_hash.each_with_index do |(key, value), index|
      puts "number: #{index} | #{key} | £#{value}"
    end
  end

  def add_to_order(name, amount)
    amount.times { @order << { name => @menu_hash[name] } }
    puts "#{@menu_hash[name]}"
  end
  
  def view_order
    puts @order
  end
end