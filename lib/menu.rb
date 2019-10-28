require_relative 'send_message'

class Dish

attr_reader :total, :number_of_items

MENU_LIST = {
   katsu_Curry: 30,
   chicken_curry: 20,
   noodles: 10,
   rice: 9,
   fries: 8
       }

    def initialize
        @number_of_items = 0 
        @total = 0
        @checkout = 0
    end 

def list_of_options
puts "display_menu"
puts "order"
puts "Selection"
puts "show_total"
puts "Checkout"
end 

 def display_menu
   list =   MENU_LIST.map {|key, values| "#{key} - £#{values}" }
list.join 
end 

def order(i)
checkout = Array.new
checkout << MENU_LIST.map {|key, values| values}
@checkout += checkout.sum {|x| x[i]}
@number_of_items += 1
end 

def selected 
    @total += @checkout
end 

def show_total
    puts "Your total is £#{total}"
end 
end 

def send_message()
end 


# def initialize
# @selection = []
# @dish_name = gets.chomp
# @name = gets.chomp
# end

# checkout.join(" , ")


# def display_menu 
#     "1: katsu_Curry: 100,
#      2: chicken_curry: 80,
#      3: noodles: 10,
#      4: rice: 9,
#      5: peas: 8"
# end 

# def selection(i)
    #     checkout = Array.new
    #     checkout << MENU_LIST.map {|key, values| "#{key} - £#{values}" }
    #     @selection << checkout.sum {|x| x[i]}
    # end 

# def selected 
# fail "You have not selected any items" if @total > 0
# c = @checkout 
# total_sum = c.sum {|x| x}
# @total += total_sum
# end 

# def no_selection 
# end