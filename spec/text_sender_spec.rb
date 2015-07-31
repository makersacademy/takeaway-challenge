require 'text_sender'

describe Texter do
  it { is_expected.to respond_to :send_message }
end
