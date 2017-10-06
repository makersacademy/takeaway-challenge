require './docs/menu.rb'

class Takeaway
  attr_reader :basket, :menu, :tally

  def initialize
    @menu = Menu.new
    @basket = []
    @tally = 0
  end

  def header
    puts "Welcome to the God of Cookery Takeaway!"
    puts "show_menu"
    puts "choose_dish(dish number, quantity)"
    puts "show_basket"
    puts "checkout(account_sid, auth_token, phone_number)"
  end

  def show_menu
    @menu.display
  end

  def choose_dish(number, quantity = 1)
    invalid_choice(number, quantity)
    quantity.times { @basket << @menu.items.keys[number - 1] }
    quantity.times { @tally += @menu.items.values[number] }
  end

  def show_basket
    @basket.uniq.map { |dishes| puts "#{dishes} x #{@basket.count(dishes)}" }
    puts total
  end

  def total
    puts "Total £#{@tally}"
  end

  def checkout(account_sid, auth_token, phone_number)
    raise("No dishes selected") if empty_basket?
    phone = Phone.new(account_sid, auth_token, phone_number)
    phone.tally = @tally
    phone.send
  end

  private

  def invalid_choice(number, quantity)
    raise("Invalid choice") if number > @menu.items.size
    raise("Invalid choice") if quantity < 1
  end

  def empty_basket?
    @basket.length.zero?
  end
end
