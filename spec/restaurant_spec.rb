require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new("KFC", "Chingford Road") }

  it { is_expected.to respond_to(:accept_order) }

end
