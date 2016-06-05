require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }

  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) { "Chicken: £5.00" }

  describe '#see_menu' do
    it 'allows a customer to see the dishs and prices' do
      expect(takeaway.see_menu).to eq(printed_menu)
    end
  end
end
# 
