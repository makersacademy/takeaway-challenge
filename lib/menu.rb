require_relative 'list'
require_relative 'messaging'

class Menu 

  def initialize(list = List.new, message = Messaging)
    @message = message.new
    @list = list #List class used here
    @selected_dishes = [] # why do we need this here?
  end

  def show_dishes #Display class?
    @list.show_dishes
  end

  def select_dishes(*args)
    @selected_dishes = @list.select_dishes(args.flatten)
  end

  def total
    @total = @list.total(@selected_dishes)
  end

  def show_selected_dishes
    @list.show_selected_dishes
  end

  def verify_order
    total
    puts check_total(@total) ? "Total of #{@total} is correct" : "We have made an error"
  end

  def put_order
    @message.send("Thank you! Your order of £#{@total} was placed and will be delivered before #{expected_delivery}")
  end

  private 

  def check_total(total)
    @total == @selected_dishes.reduce(0) {|total,dish| total + dish.price} # undefined method []
  end

  def expected_delivery
    expected_delivery = (Time.now + 60*30).strftime "%H:%M"
  end
end
