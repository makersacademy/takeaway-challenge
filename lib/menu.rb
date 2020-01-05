require_relative 'shopping_basket'
require_relative 'text'

class Menu 

  attr_reader :menu

  def initialize(shopping_basket=ShoppingBasket.new)
    @menu = [
      {pizza: 10},
      {salad: 8},  
      {pasta: 8}, 
      {curry: 11}, 
      {chili: 12}
      ]
    @shopping_basket = shopping_basket
  end 


  def print_menu
    puts "Menu:"
    counter = 1
    menu.each do |hash|
      hash.each do |key, value|
        puts "#{counter}) #{key.capitalize} - £#{value}"
      end
      counter +=1
    end
    puts "6) Finalise Order"
  end

  def order_process(selection) #should add ability to select multiple items at once ?
    case selection 
      when "1"
        #puts "Please enter quantity: "
        #quantity = gets.chomp
        @shopping_basket.add_item(@menu[0]) #* quantity
        @shopping_basket.pizza_count += 1 #quantity
        @shopping_basket.print_basket
      when "2"
        @shopping_basket.add_item(@menu[1])
        @shopping_basket.salad_count += 1
        @shopping_basket.print_basket
      when "3"
        @shopping_basket.add_item(@menu[2])
        @shopping_basket.pasta_count += 1
        @shopping_basket.print_basket
      when "4"
        @shopping_basket.add_item(@menu[3])
        @shopping_basket.curry_count += 1
        @shopping_basket.print_basket
      when "5"
        @shopping_basket.add_item(@menu[4])
        @shopping_basket.chili_count += 1
        @shopping_basket.print_basket
      when "6"
        puts "Final order: "
        @shopping_basket.print_basket
        puts "Thankyou, order complete. You will receive a confirmation text shortly."
        text = Text.new
        text.send_text
        #method that presents final order 
        #method that shows total cost
        #method that sends text
        
        exit #then exits program 
      end 
  end 

  def interactive_menu
    loop do 
      print_menu 
      order_process(STDIN.gets.chomp)
    end 
  end 
  

end 
