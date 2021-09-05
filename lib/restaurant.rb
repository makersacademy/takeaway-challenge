class Restaurant

attr_reader :list_of_dishes
attr_reader :order

def initialize
@list_of_dishes = {:burger => 10 , :pizza => 5}
@order = []
end 

def select_dish(choice)
  @order << choice.downcase
end


end