require_relative "./order.rb"

class Message

DELIVERY_TIME = 3600

attr_reader :compl_timestamp, :delivery_time 

def initialize(compl_timestamp)
  @compl_timestamp = compl_timestamp
  @delivery_time = compl_timestamp + DELIVERY_TIME

end

end
