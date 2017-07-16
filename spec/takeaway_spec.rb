require 'takeaway'

describe Takeaway do
  let(:menu) { double(
    :menu,
    dishes:
      {
        "Onion Bhaji" => 2.5,
        "Chicken Tikka Masala" => 7.2,
        "Bombay Aloo" => 2.5,
        "Garlic Naan" => 2.1,
        "Vegetable Samosa" => 2.5
      }
    )
  }
  subject(:takeaway) { described_class.new menu }

end
