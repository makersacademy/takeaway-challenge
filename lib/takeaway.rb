# require 'takeaway_texts'

class Takeaway
  attr_reader :menu_list, :name, :number

  def initialize(name='no_name', number='+447479365828')
    @name = name
    @number = number
  end

  def menu
    @menu_list = {icecream: 5,
                  dohnuts: 2,
                  potatoes: 1}
  end



  # def order(*orders)
  #   orders.each(|x,y| total << menu_list[x] * y)
  # end
end
