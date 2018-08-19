require_relative "message"

class Order
  # for storing the order details
  attr_reader :dishes, :total

  def initialize(customer, request)
    @dishes = {}
    add_dishes(request)
    @customer = customer
  end

  def count
    @dishes.values.inject(:+)
  end

  def confirm(message = Message.new)
    if count == total
      message.send_confirmation
    else
      false
    end
  end

  private
  def add_dishes(request)
    request.split(",").each { |m|
      meal = m.split("-")[0].strip.downcase
      number = m.split("-")[1].strip.to_i
      if meal == "total"
        @total = number
      else
        @dishes[meal] = number
      end
    }
    @dishes
  end
end
