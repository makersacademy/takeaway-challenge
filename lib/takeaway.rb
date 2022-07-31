class Takeaway

  attr_reader :menu, :dishes

  def initialize 
    @menu = menu
    @dishes = []
  end

  def menu
    menu = [
      { dish: 'breadfruit', price: 8.00 },
      { dish: 'macaroni', price: 3.00 },
      { dish: 'plantain', price: 2.00 }, 
      { dish: 'avocado', price: 4.00 }, 
      { dish: 'salad', price: 5.00 }
    ] 

  end 
end 
