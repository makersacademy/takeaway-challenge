class Menu 
  attr_reader :items  
  def initialize 
      @items = {"pasta" => 6.75, "roast" => 12.50,
              "curry" => 7.5, "kebab" => 5.00, "salad" => 1}
      
    end 
    def display #need to print menu here 
    items
end 
end 