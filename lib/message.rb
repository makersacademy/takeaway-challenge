require_relative "./order.rb"

class Message

attr_reader :compl_timestamp

def initialize(compl_timestamp)
  @compl_timestamp = compl_timestamp

end

end
