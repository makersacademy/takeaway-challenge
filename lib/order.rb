class Order 
  attr_reader :basket, :menu, :total, :twilio_api

  def initialize(menu, number, twilio_api: TwilioApi.new)
    @menu = menu
    @number = number
    @twilio_api = twilio_api
    @basket = []
    @total = 0
  end

  def add_dish(choice)
    @basket << @menu.pick_dish(choice)
    @total += @basket.last.price
  end

  def check_total
    @basket.each { |dish| puts "#{dish.name} : #{dish.price}" }
    puts "Added together is #{@total}"
  end

  def complete_order(number) 
    # rubocop says this in an argument error but it should be required by message in TwilioApi
    @twilio_api.message
  end
end
