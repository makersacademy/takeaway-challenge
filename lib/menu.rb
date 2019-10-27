require_relative 'send_message'
class Dish

attr_reader :total, :number_of_items

MENU_LIST = {
   katsu_Curry: 100,
   chicken_curry: 80,
   noodles: 10,
   rice: 9,
   peas: 8
       }

    def initialize
        @number_of_items = 0 
        @total = 0
        @selection = []
        @checkout = []
    end 

def display_menu
    "1: katsu_Curry: 100,
     2: chicken_curry: 80,
     3: noodles: 10,
     4: rice: 9,
     5: peas: 8"
end 

def selection(i)
    checkout = Array.new
    checkout << MENU_LIST.map {|key, values| key , values}
    @selection << checkout.sum {|x| x[i]}
    @number_of_items += 1
end 

# def order(i)
# checkout = Array.new
# checkout << MENU_LIST.map {|key, values| values}
# # checkout.join(" , ")
# @checkout << checkout.sum {|x| x[i]}



# end 

private 
def selected 
c = @checkout 
total_sum = c.sum {|x| x}
@total += total_sum
end 



end 





# @dish_name = gets.chomp
# @name = gets.chomp




