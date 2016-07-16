

class Menu
attr_reader :items

  def initialize
    @items = {
      "Mealworm Croquettes" => 1.20,
      "Larve Paprika Crisps" => 1.50,
      "Crunchy Chicken Claw" => 2.40,
      "Zingy Zebra Bites" => 3.80,
      "Springbok rolls" => 4.30,
      "Buffalow salad" => 10.20,
      "Ostrich steak" => 13.55,
      "Crocodile burger" => 14.25,
      "Kangaroo con carne" => 15.20,
      "Python soup" => 17.50,
      "Pufferfish cakes" => 21.50,
    }
    items.each do | item, price |
     puts "#{item}: $#{price}"
     end

    def menu_check(dish)
      @items.has_key?(dish)
    end

  end
  #   items.each do | item, price |
  #   puts "#{item}: $#{price}"
  #   end
  # end

  # def price(dish)
  #   @items.select{|k,v| k == dish}
  #   puts "#{dish} is £#{price}!"
  #   #  @items.each do |dish, price|
  #   #    return "#{dish} is £#{price}!"
  #    #end
  #  end

end
