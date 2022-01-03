class Restaurant
  attr_reader :menu

  def initialize
    @menu = {
      'bibimbap'=>10.50,
      'bulgogi'=>10.00,
      'naengmyeon'=>8.00
    }
  end

  def see_menu
    @menu.each { |k, v| @menu[k] = "£%.2f" % v.to_s } 
  end

  

  # do I need a select item method?
  # Can I select using the index like in a Chinese restaurant?  
  # select index and return value can be item, price
  # would this return as an array? I want two separate values...

  # price of item
  # name of item

end