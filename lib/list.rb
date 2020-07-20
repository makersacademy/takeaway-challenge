class Menu

  def initialize
    @list = {"1" => ["chicken", 3], "2" => ["fish", 3], "3" => ["lamb", 5], "4" => ["beer", 2] }
    @order = Order.new
  end

  def greet
    "Hi there! This is our menu for today: "
  end

  def display_menu
    @list.each { |number, dish| puts "#{dish[0]} --- £ #{dish[1]}" }
  end

  def select
    number = nil
    while number != "x" do
      puts " \n Enter number of dish (or print x to leave) \n"
      number = gets.chomp
      @order.take(@list[number]) if [1, 2, 3, 4].include? number.to_i
      @order.show
    end
    confirm
  end

  def confirm
    print "Are you happy with that? \n (press x to agree or any other key to disagree)"
    input = gets.chomp
    @order.proceed if input == "x"
    bye if input != "x"
  end

  def bye
    print "Bye then. Type exit to leave irb!"
  end

    end

  class Order

    def initialize
      @order_list = []
      @total = 0
    end

    def take(dish)
      @order_list << dish
      @total += dish[1]
    end

    def show
      print "Your order: #{@order_list}. \n Total is #{@total} "
    end

    def timing
      Time.now + 3600
    end

    def message
      #Twilio here
    end

    def proceed
      print "Thank you! Your order has been accepted"
      #pass order to kitchen
      #Twilio message here
    end
  end
