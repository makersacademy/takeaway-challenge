require 'messenger'

describe Messenger do
  it {is_expected.to respond_to(:send_message).with(1).argument}
end
