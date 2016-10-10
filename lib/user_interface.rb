require_relative 'order'
require_relative 'user'

#class UserInterface
  def greeting
    puts 'Welcome to TakewaY'
    puts '=================='
    puts 'If you are an existing user please enter your email now, otherwise just press enter.'
    get_user_details
  end

  def get_user_details
    input = gets.chomp
    if input == ''
      new_user
    else
      @user = nil
      users = load_users
      users.each do |u|
        if u.email = input
          @user = u
          break
        end
      end
      if @user == nil
        puts 'Sorry, no user found, please try again'
        get_user_details
      end
    end
  end

  def menu
    puts'what would you like to do?'
    puts '1. create a new order'
    puts '2. view an existing order'
    menu_select
  end

  def menu_select
    puts 'Please enter the number that corresponds to your selecion' 
    selection = gets.chomp.to_i
    menu_select if selection != 1 || selection != 2
    case selection
    when 1
      new_order
    when 2
      choose_order
    end
  end

  def new_user
    print 'pleae enter your name: '
    name = gets.chomp
    print 'pleae enter your email: '
    email = gets.chomp
    print 'pleae enter your address: '
    adress = gets.chomp
    print 'pleae enter your phone number: '
    phone = gets.chomp
    @user = User.new(name, email, address, phone)
  end

  def new_order
    @new_order = Order.new(@user)
  end

  def display_price(price)
    "£#{price.to_s.insert(-3,'.')}"
  end

  def view_order(requested)
    order = @orders[requested - 1]
    if order.items.length < 1
      puts "No items ordered"
    else 
      n = 1
      order.items.each do |i|
        puts "#{n}. #{i.name}, #{display_price(i.price)}"
        n += 1 
      end
      puts 'Total: ', display_price(i.total)
    end
  end
#end

greeting