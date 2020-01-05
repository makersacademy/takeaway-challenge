class Menu

  attr_reader :items

  def initialize
    @items =   { 
      1 => ['rice', 1], 
      2 => ['chicken', 4], 
      3 => ['noodles', 2],  
      4 => ['soup', 2], 
      5 => ['prawn crackers', 1]
    }
  
  end

end