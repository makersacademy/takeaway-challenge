require 'message'

describe Message do

  subject(:message) { described_class.new }
  let (:message_body) { "Thank you for the order! It will be de delivered by #{Time.new.hour + 1}:#{Time.new.min}" }

end
