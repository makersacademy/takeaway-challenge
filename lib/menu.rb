require_relative 'list'

class Menu 
  def initialize(list = List)
    @list = list #List class used here
    @selected_dishes = [] # why do we need this here?
  end

  def show_dishes #Display class?
    @list.show_dishes
  end

  def select_dishes(*args)
    @selected_dishes = @list.select_dishes(*args)
  end

  def total
    @total = @list.total(@selected_dishes)
  end

  def show_selected_dishes
    @list.show_selected_dishes
  end

  def verify_order
    check_total(@total) ? "Total of #{@total} is correct" : "We have made an error"
  end

  private 

  def check_total(total)
    @total == @selected_dishes.reduce(0) {|total,dish| total + dish.price} # undefined method []
  end
end
