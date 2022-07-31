require 'sms'

class Takeaway 

  def initialize(takeaway_menu:, sms_class: nil)
    #has to have the same name for it to be recognised and passed 
    @sms = nil 
    if sms_class
      @sms = sms_class.new
    end 
    @menu = takeaway_menu
  end 

  def see_menu
    @menu
  end 

  def order(food)
    @food = food
    true 
  end 

  def total
    #how to retrieve food in the order. Get food variable. Iterate, price x quantity
    # map will return an array with transformed values of the result of the block
    # each will not return anything, you have to save it
    # extract the prices from the menu item, using the food order, match with menu to get price
    total = 0
    # food |element| iterate through menu

    @food.each do | element |
      price =  @menu.select {|dish| element[:item] == dish[:item]}.first[:price]
      total += price * element[:quantity]
    end 
    total
  end 

  def delivery_confirmation
    in_one_hour = (Time.new +3600).strftime("%H:%M")
    "Thank you. Your order was placed and will be delivered before #{in_one_hour}"
  end 

  def send_delivery_confirmation
    if @sms
      @sms.send_sms(delivery_confirmation, "09790790")
    else
      raise "The SMS service has not been initialised" 
    end 
  end 
end 