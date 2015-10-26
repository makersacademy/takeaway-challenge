require 'message'
require './spec/support/shared_examples_for_message.rb'

class MessageTest
  include Message
end

describe MessageTest do
  it_behaves_like Message
end
