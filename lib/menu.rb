
class Menu
  
  def initialize 
    @selection = [{ food: "tofu", price: 5 }, { food: "tofu", price: 5 }, 
    	{ food: "tofu", price: 5 }, { food: "tofu", price: 5 }, 
    	{ food: "tofu", price: 5 }]   
  end

  def choices
    @selection.dup
  end

end
