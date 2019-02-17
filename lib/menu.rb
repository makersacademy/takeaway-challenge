class Menu

  attr_reader :dishes


  def initialize(dishes)
    @dishes = dishes
  end


 def print
    dishes.map do |title, price|  # we need to get a dishes. On Hash we can call map
      '%s £%.2f' % [title.to_s.capitalize, price]  # map is gping through each value in Hash and changing in something different and we need to change into string
    end.join(', ') #join this array
    # load up from file stuff
  end

end
