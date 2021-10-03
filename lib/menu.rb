class Menu

  attr_reader :menu

  def initialize
    @menu = [{:name=>"Risotto", :price => 7.99},
      {:name=>"Large Pizza", :price => 12.99},
      {:name=>"Fried Chicken", :price => 6.99},
      {:name=>"Green Salad", :price => 5.99},
      {:name=>"Pasta", :price => 8.99},
      {:name=>"Vegetable Curry", :price => 6.50},
      {:name=>"Rice", :price => 1.99},
      {:name=>"Steamed Vegetables", :price => 1.99}]
  end

  def display
    menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]}, Price: £#{item[:price]}"
    end
  end

  def welcome
    puts "Welcome to Sergei's takeaway"
  end

  def order_food
    puts "Enter the menu number"
    display
  end
end
