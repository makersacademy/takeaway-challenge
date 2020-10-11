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
      raise 'Selection must be entered in the format ":dish=>quantity"' if dishes.class != Hash
      raise 'Quantity must be an integer e.g. 4' if !dishes.values.any?(Integer)
      raise 'Dish selected must be a symbol e.g. :Hamburger' if !dishes.keys.any?(Symbol)
      @dishes = dishes
      @bill.calculate_total(@dishes)

    end

    def print_all
      @printer.print_dishes(MEAL_OPTIONS)
    end

    def total_entered(total)
      @customer_total = total
      total_error
    end

    def total_error
      raise "Total entered (£#{@customer_total}) is incorrect.  Actual total is £#{@bill.total}" if @customer_total != @bill.total
      puts "Amount given is correct.  Food ordered"
    end

    def store_order
      @bill.store_order(@dishes)
    end

    def print_dishes
      store_order
      puts @bill.order
    end

end
