class Takeaway

  attr_reader :dishlist

  def initialize
    @dishlist = []
  end


  def add_dish(dish)
    @dishlist << dish
  end

  def menu
    menu = ""
    @dishlist.each do |dish|
      price = '%.2f' % dish.price
      menu = menu+"#{dish.name} -- #{price}\n"
    end
    menu
  end


end