class Takeaway

  require 'ap'
  require 'twilio-ruby'

  def initialize

    @menu = {
      1 => "Chicken Chow Mein (£6.75)",
      2 => "Pork Rendang (£5.50)",
      3 => "Pad Thai (£6.90)",
      4 => "Chicken Parmo (£4.50)",
      5 => "Paneer Korma (£5.50)"
    }

    @prices = {
      1 => 6.75,
      2 => 5.50,
      3 => 6.90,
      4 => 4.50,
      5 => 5.50
    }

    @order = []
    @orders_array = []
    @running_total = 0
  end

  ###################################################

  def interface

      puts "*** Welcome to the takeaway ***"
      puts "Select from the following options:"
      puts "To view the menu, press 1"
      puts "To make an order, press 2"
      puts "To exit, press 3"
      selection = gets.chomp
      case selection
      when "1"
        print_menu
      when "2"
        select_dish
      when "3"
        puts "Thank you, goodbye!"
        exit
      else
        "Please try again"
        interface
      end
    end
  end


    ######################

    def print_menu
      ap @menu
    end

    #######################

    def select_dish
      puts "Enter the number of the dish you'd like to order"
      puts "When you're finished, type 'done'"
      puts "If you've changed your mind, type 'exit'"
      @dish_selection = gets.chomp
      validate_selection
    end

    def validate_selection
      case @dish_selection
      when "done" then order_summary
      when "exit" then puts "Thank you, goodbye"
        exit
      else
        @dish_selection = @dish_selection.to_i
        @order << @dish_selection
        select_quantity
      end
    end

    def select_quantity
      puts "How many would you like?"
      @dish_quantity = gets.chomp.to_i
      @order << @dish_quantity
      calculate_total
    end

    def calculate_total
      @selection_cost = @dish_quantity * @prices[@dish_selection].to_f
      calculate_running_total
      return_order
    end

    def calculate_running_total
      @running_total += @selection_cost
      @order << @selection_cost
      @orders_array << @order
      @order = []
    end

    def return_order
      puts "So thats #{@dish_quantity} x #{@menu[@dish_selection]} costing £#{@selection_cost.round(3)}"
      select_dish
    end

    # Enter number of dish you'd like to Order
    # Enter the Quantity of dishes
    # Exit and confirm
    # Change Order
    # Start again
    # Exit
    def order_summary
      puts "ORDER SUMMARY:"
      @orders_array.each_with_index do |x,index|
        puts "#{index + 1}. #{x[1]} x #{@menu[x[0]]}: £#{x[2]}"
      end
      puts "-----------"
      puts "TOTAL: £#{@running_total}"
      confirm_order
    end

    def confirm_order
      puts "To confirm, press 'y'"
      puts "To redo the order, press 'n'"
      @confirmation = gets.chomp
      confirmed?
    end

    def confirmed?
      case @confirmation
      when @confirmation == "y"
        send_confirmation
      when @confirmation == "n"
        select_dish #spawn new instance of order
      else
        puts "Not a valid entry, try again"
      end
    end


    def send_confirmation
      # take telephone number
      # send confirmation message
    end

  end

  takeaway = Takeaway.new

  takeaway.interface
