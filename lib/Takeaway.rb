require './lib/menu.rb'
class Takeaway
  def initialize
    @order =[]
  end

   def select(item)
       @order << item
   end
end
