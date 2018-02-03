require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:menu)         { double("menu") }
  let(:printed_menu) { "Prawn Crackers - £1.51, Prawn Gyoza - £3.51, Chicken Gyoza - £3.11, Spring Rolls - £3.15" }

  it 'allows the user to see a list of dishes with prices' do
    expect(takeaway.see_menu).to eq(printed_menu)
  end

end
