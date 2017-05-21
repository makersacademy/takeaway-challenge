require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new("KFC", "Chingford Road") }

  it { is_expected.to respond_to(:create_customer_order) }
  it { is_expected.to respond_to(:accept_customer_order).with(1).argument }

end
