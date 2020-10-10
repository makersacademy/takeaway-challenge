class Printing

  def initialize(phone, dishes)
    @phone = phone
    @dishes = dishes
  end

  def menu
    puts "Menu:\n-----"
    puts @dishes.format_items
  end

  def enter_id
    puts "Please enter the FULL ID number or 'end' to finish ordering: "
  end

  def enter_quantity(order_item)
    puts "Please enter quantity of #{order_item[0][:item]}"
  end

  def order(order_list)
    if order_list.empty?
      puts "You haven't ordered yet!..."
    else
      puts "Your Order:\n\n"
      order_list.each { |each|
        # order_select = @dishes.select_item(each[0])
        order_select = @dishes.select_item(each[0])[0]
        # print "£#{((order_select[0][:price]).to_i * each[1].to_i)} "
        print "£#{((order_select[:price]).to_i * each[1].to_i)} "
        # puts ": #{each[1]} x #{order_select[0][:item]}"
        puts ": #{each[1]} x #{order_select[:item]}"
      }
      puts "-----"
      puts "Is this correct?: yes/no"
      correct = gets.chomp
      @phone.send_text if correct == 'yes'
    end
  end

end
