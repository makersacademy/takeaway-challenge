class Menu
attr_reader :meal_options, :dishes, :customer_total

  def initialize(printer = Print.new, bill = BillCalculator.new)
    @meal_options = [
    {"Hamburger"=>5},
    {"Pizza"=>6},
    {"Pasta"=>4},
    {"Fish and chips"=>5},
    {"Salad"=>3},
    {"Lamb shank"=>7}]
    @dishes = dishes
    @printer = printer
    @customer_total
    @bill = bill
  end

  def select(dishes)
    @dishes = dishes
  end

  def print_all(dishes)
     @printer.print_dishes(dishes)
   end

   def total_entered(total)
     @customer_total = total
   end

   def total_error(bill)
     @bill.total = bill
     raise "Total entered (£#{@customer_total}) is incorrect.  Actual total is £#{@bill.total}" if @customer_total != @bill.total
   end

   def store_order
     @bill.store_order(@dishes)
   end

   def print_dishes
      puts @bill.order
   end

end
