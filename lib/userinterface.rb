require_relative 'order'

class UserInterface
  attr_reader :new_order
  attr_reader :user_input_item, :user_input_num, :user_input_mobile
  
  def initialize
    @new_order = Order.new
  end
  
  def close
    system "clear"
    print "\n     Ruby's Ramen!\n-----------------------\n"
    print "Thank you for visiting.\nPlease come again soon.\n\n"
    exit
  end
  
  def oops
    print "Did you make a mistake?\n"
    print "(type 'cancel' if you don't wish to continue)\n"
  end
  
  def mobile_number
    while true
      @user_input_mobile = gets.chomp.downcase
      if user_input_mobile == "cancel"
        break
      elsif (user_input_mobile =~ /\D/) != nil
        oops()
      elsif user_input_mobile.length != 11
        oops()
      else 
        new_order.checkout(user_input_mobile.to_i); close()
      end
    end
  end
  
  def checkout
    system "clear"
    print "What is your mobile number?\n(e.g. 01234567890)\n"
    mobile_number()
  end
  
  def quantity
    print "...and how many would you like?\n"
    while true
      @user_input_num = gets.chomp.downcase
      if user_input_num == "cancel"
        break
      elsif (user_input_num =~ /\D/) != nil
        oops()
      else
        new_order.add(user_input_item.split.map(&:capitalize).join(" "), user_input_num.to_i); break
      end
    end
  end
  
  def audience_participation
    while true
      @user_input_item = gets.chomp.downcase
      if user_input_item == "exit"
        close()
      elsif user_input_item == "cancel"
        break
      elsif user_input_item == "checkout" && new_order.order.empty?
        break
      elsif user_input_item == "checkout"
        checkout(); break
      elsif !new_order.menu.items.include?(user_input_item.split.map(&:capitalize).join(" "))
        oops()
      else 
        quantity(); break
      end
    end
  end

  def order_check_a
    @new_order.show if !new_order.order.empty?
  end

  def order_check_b
    print "(type 'checkout' to submit the order)\n" if !new_order.order.empty?
  end
  
  def header
    print "\n      Welcome to Ruby's Ramen!\n"
    print "------------------------------------\n"
    new_order.menu.show
    order_check_a()
    print "'Exit' to leave.\n\n"
  end

  def main
    while true
      system "clear"
      header()
      print "What would you like?\n"
      order_check_b()
      audience_participation()
    end
  end
end

UserInterface.new.main
