require 'takeaway'

describe Takeaway do
   let(:menu)  { double :menu, display_menu: 'carbonara' }
   let(:order)  { double :order }
  subject(:takeaway)  { Takeaway.new(order, menu) }

  describe "#read_menu" do
    it 'prints out menu' do
      expect{ takeaway.read_menu }.to output("carbonara\n").to_stdout
    end
  end
end
