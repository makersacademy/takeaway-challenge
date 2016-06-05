require 'takeaway'

describe Takeaway do
  it { is_expected.to respond_to(:send_text) }
end
