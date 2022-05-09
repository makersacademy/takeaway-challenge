require 'takeaway'

describe Takeaway do
  let(:takeaway) {Takeaway.new}
  let(:menu) { double(:menu, list: { Potato: 1, Hummus: 2 }) }
  
  describe '#menu_print' do
  it 'gives a strings of the dishs and price for the customer to see' do
#     expect(takeaway(:menu).menu_print).to eq "Potato: £1\nHummus: £2\n"
#   end
expect(takeaway.menu_print).to output("Potato: £1\nHummus: £2\n").to_stdout
  end
  end





end