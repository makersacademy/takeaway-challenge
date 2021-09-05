class Restaurant

attr_reader :list_of_dishes
attr_reader :order

def initialize
@list_of_dishes = {"burger" => 10, "pizza" => 5, "pasta" => 15, "wings" => 7, "kombucha" => 3 ,"coke"=> 3}
@order = {}
end 

def read_menu
@list_of_dishes
end 

def select_dish(choice)
  @list_of_dishes.each {|k,v| if k == choice.downcase
  @order.merge!(k => v)
  end}
  
  #running_total = order
end


end