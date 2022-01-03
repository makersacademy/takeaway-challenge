require './lib/send_sms.rb'

class ConfirmOrder
  attr_reader :contact_number, :ordered_time, :ordered_list, :total

  def initialize(ordered_time, ordered_list, total)
    @ordered_time = ordered_time
    @ordered_list = ordered_list
    @total = total
    send_confirmation
  end
  
  def send_confirmation
    delivery_time = @ordered_time + (60*60)
    message = Send_sms.new(delivery_time, @ordered_list, @total)
  end

end