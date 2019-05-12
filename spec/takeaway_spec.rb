require 'takeaway'
require 'menu'

describe Takeaway do
  describe '#view_menu' do
    subject(:takeaway) { Takeaway.new(menu) }
    let(:menu) { double :menu }

    it 'delegates to prices method' do
      allow(menu).to receive(:prices).and_return("spaghetti bolognese: £4.55
        ham and cheese pancake: £3.75
        double-cheeseburger: £4.25
        curly fries: £1.75")
      expect(takeaway.view_menu).to eq("spaghetti bolognese: £4.55
        ham and cheese pancake: £3.75
        double-cheeseburger: £4.25
        curly fries: £1.75")
    end
  end
end
