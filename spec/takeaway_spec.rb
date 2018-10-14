# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, print: 'Falafel: £3') }

  it 'allows the user to see a list of dishes and prices' do
    expect(takeaway.display_menu).to eq 'Falafel: £3'
  end
end
