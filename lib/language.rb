class Language

  def self.greeting
    puts "Welcome to Steph's takeaway. Below is our food."
  end

  def self.request_dish
    puts "Please enter a dish"
  end

  def self.request_quantity
    puts "How many would you like?"
  end

  def self.confirm(list, menu)
    puts "Your order comes to"
    list.each {|i, q| puts "#{q} #{i}s at £#{menu.list[i]} each"}
    puts ""
    puts "Please enter the payment amount"
  end

  def self.number
    puts "Please enter your mobile number"
  end

end
