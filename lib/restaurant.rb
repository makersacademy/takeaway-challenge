
class Restaurant
  def initialize ( messenger, menu)
    @messenger = messenger
    @menu = menu
    @header = { :from => '+441290211165', :to => '+447527994300'}
  end

  def request_takeaway
    takeaway = Takeaway.new(self, @menu)
  end

  def order_takeaway
    #calculate time in one hours time
    delivery_time = Time.now + 3600
    message_body = "Thank you! Your order was placed and will be delivered before #{delivery_time}"

    @messenger.create(@header[:from], @header[:to], message_body)
  end
end