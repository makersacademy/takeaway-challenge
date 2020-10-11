class Menu
attr_reader :meal_options, :dishes, :customer_total, :store_order

MEAL_OPTIONS = {:Hamburger=>5, :Pizza=>6, :Pasta=>4,:Fish_and_chips=>5,:Salad=>3,:Lamb_Shank=>7}

  def initialize(printer = Print.new, bill = BillCalculator.new(MEAL_OPTIONS))
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

   def total_error
     @bill.total
     @bill.calculate_total(@dishes)
     raise "Total entered (£#{@customer_total}) is incorrect.  Actual total is £#{@bill.total}" if @customer_total != @bill.total
   end

   def store_order
     @bill.store_order(@dishes)
   end

   def print_dishes
      puts @bill.order
   end

end
