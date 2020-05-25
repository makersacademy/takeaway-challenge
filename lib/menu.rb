require_relative './formatter'

class Menu

attr_reader :dishes

  def initialize(formatter = Formatter.new)
    @dishes = {"Large Fish Supper" => 7.90, "Small Fish Supper" => 5.50,  "White Sausage" => 2.30, "Deep Fried Mars Bar" => 2.00}
    @formatter = formatter
  end

  def get_menu
    @formatter.format_menu(@dishes)
  end

  def not_on_menu?(dish)
    @dishes.each_key do |key|
      return false if dish.downcase  == key.downcase
    end
  end

  def get_name(dish)
    @dishes.each_key do |key|
      return key if dish.downcase  == key.downcase
    end
  end

  def get_price_for(dish)
    @dishes.each do |key,value|
      return value if dish.downcase == key.downcase
    end
  end
end
