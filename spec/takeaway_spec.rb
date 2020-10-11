require 'takeaway'

describe Takeaway do
   let(:menu)  { double :menu, display_menu: 'carbonara' }
   let(:order)  { double :order }
  subject(:takeaway)  { Takeaway.new(order, menu) }

  describe "#read_menu" do
    it 'prints out menu' do
      expect(takeaway.read_menu).to eq('carbonara')
    end
  end
end
