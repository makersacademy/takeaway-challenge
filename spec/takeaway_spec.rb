require 'takeaway'

describe Takeaway do
  let(:menu) { double(
    :menu, dishes:
      { "Onion Bhaji" => 2.5,
        "Chicken Tikka Masala" => 7.2,
      }
    )
  }

  subject(:takeaway) { described_class.new(menu) }
  it { is_expected.to respond_to(:order) }

end
