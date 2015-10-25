require 'restaurant'

describe Restaurant do
  let (:messenger) {double :messenger}
  let (:menu) {double :menu}

  subject(:Restaurant) {described_class.new :messenger, :menu}

  it { is_expected.to respond_to(:request_takeaway) }
  it { is_expected.to respond_to(:order_takeaway) }

end