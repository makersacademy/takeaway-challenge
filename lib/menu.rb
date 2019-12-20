class Menu
 # open/close principle - open to extension closed to modification
  attr_reader :dishlist
 def initialize(dishlist)
    @dishlist = dishlist
  end
  
  
  def prints
    dishlist.map do |name, price|  "%s £%.2f" % [name, price]
    end.join(", ")
  end
end