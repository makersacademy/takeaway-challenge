
class TakeAway
  def initialize
    @menu = {"egg roll" => 3.99 , "lasagna" => 13.99 , "fries" => 2.99 , "wonton soup" => 5.99 , "chicken chow mein" => 6.99}
    @order = []
    @total = 0
  end

  def submit_order
    for i in 0..@order.length-1
      @total = @total + @menu[@order[i]]
    end
    require 'twilio-ruby'

    account_sid = 'AC7c12d4befcc01c780756144381883869'
    auth_token = '1c399e1dd4435670f79419e51c6e7266'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441290211637' # Your Twilio number
    to = '+447748964098' # Your mobile phone number

    client.api.account.messages.create(
    from: from,
    to: to,
    body: "Hi, your order is #{@order} . Total: £ #{@total} . IT will be delivered by #{Time.now + 1*60*60}"
    )
  end

  def add_to_order(menu_item , quantity = 1)
      if @menu.member?(menu_item)
        quantity.times do
          @order << menu_item
        end
      else
        puts "item not present on menu, please view menu and order an item from the menu"
      end
  end

  def remove_from_order(menu_item , quantity = 1)
  end

  def check_order
    puts "your order so far:"

    for i in 0..@order.length-1
      puts "#{@order[i]}...#{@menu[@order[i]]}"
      @total = @total + @menu[@order[i]]
    end
    puts "Total : £#{@total}"

  end
  def view_menu
    puts @menu
  end
end
