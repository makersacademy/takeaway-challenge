require 'message'

describe Message do
  it {is_expected.to respond_to(:send_message).with(2)}
end
