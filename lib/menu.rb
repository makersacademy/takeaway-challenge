require 'texttool'

class Menu
  include TextTool
  attr_reader :dishlist, :ordered

  def initialize
    @dishlist = []
    @ordered = []
  end

  def add_dish(dish)
    @dishlist << dish    
  end

  def custom_order(customer, order)
   if order.total == order.dishes.length
        order.dishes.each {|dish| @ordered << dish}

      else raise 'Please check the sum of your ordered dishes'
    end
  end

  def inform_customer(customer)
     @client.messages.create(
          from: '+441709242179',
          to: customer.tel,
          body: "Dear #{customer.name}, Your food will be ready in 15 minutes"
        )

     puts "Message has been sent"

      
  end
end