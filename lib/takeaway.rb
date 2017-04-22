require './lib/print'

class Takeaway
  DISHES = { :pho => 5.99, :curry => 3.99, :noodles => 5.99, :chicken_wings => 4.99 }
  PRINT = Print.new

  def list_of_dishes
    PRINT.print_dishes(DISHES)
  end

end
