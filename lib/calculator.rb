class Calculator

  attr_reader :total_sum, :dishes

  def send_sms
    answer = gets.chomp
    if answer == "n"
      puts "Please order again."
      Menu.new.view_dishes
  #  else
#######  TWILIO HERE ###########
    end
  end

  def error_check
    fail "No such item on menu. Please re-order." unless verify_order
  end

  def shift_to_calculator
    calculate()
  end


private

  def calculate
    @total = []
    order.each do |dishes|
      @dishes = dishes
      @dish_number = dishes[0]
      error_check
      @subtotal = dish_list[(dishes[0])-1].values[0].to_f * dishes[1]
      print_subtotal()
      add_subtotal_to_total
    end
    print_total()
  end


  def print_subtotal
      puts "#{dishes[1]} x #{dish_list[dishes[0]-1].keys[0]} = #{@subtotal}"
  end

  def add_subtotal_to_total
    @total << @subtotal
    @total_sum = @total.inject(:+)
  end

  def print_total
    print "Total = #{@total_sum}\nIs this correct? (y | n)\n"
    send_sms
  end

end
