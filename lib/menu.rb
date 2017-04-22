
class Menu

LIST_OF_DISHES = { 'formule1' => 10, 'formule2' => 15, 'formule3' => 20, 'drink' => 5 }

attr_reader :order

   def initialize
     @order={}
     @total
   end

  def print
    p LIST_OF_DISHES
  end

  def select(dishes = [], quants = [], total)
    @order = dishes.zip quants
    @total = total
  end

  def correct_total
    tot = 0
    @order.each do |dish, quant|
       tot=tot + LIST_OF_DISHES[dish]*quant
    end
    tot
  end

  # def checkout?
  #   fail 'The total sum is not correct' if @total != LIST_OF_DISHES.values*@quants
  #   true
  # end

  #
  #
  #   @total = LIST_OF_DISHES[dishes]*@quants

  #select from the menu
  #check if the total sum is right
  #send confirmation text

end
