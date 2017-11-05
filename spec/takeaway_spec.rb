require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:new_order) { [{ name: 'burger', price: 5 }, { name: 'burger', price: 5 }] }
  let(:order) { double(add_dish: new_order, total: 10) }

  describe '#show_menu' do
    it "should show the menu" do
      allow(takeaway.menu).to receive(:show).and_return 'full_menu'
      expect(takeaway.show_menu).to eq 'full_menu'
    end
  end

  describe '#add' do
    it "should add a dish to order" do
      expect(takeaway.add('burger', 2)).to eq new_order
    end
  end

  describe '#check_total' do
    it "should show total of order" do
      takeaway.add('burger', 2)
      expect(takeaway.check_total).to eq 10
    end
  end
end
