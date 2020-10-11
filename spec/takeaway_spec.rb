require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  let(:payment) { double :payment }
  let(:test_menu) { { "California Rolls" => 8 } }
  let(:test_order) { [{ "California Rolls" => 4 }] }
  let(:takeaway) { described_class.new(menu, order) }
  let(:test_takeaway) { described_class.new(test_menu, test_order) }
  let(:correct_payment) { 32 }
  let(:incorrect_payment) { 100 }

  describe '#view_menu' do
    it { is_expected.to respond_to(:view_menu) }

    it 'prints the menu' do
      allow(order).to receive(:new)
      expect(menu).to receive(:print_menu)
      takeaway.view_menu
    end
  end

  describe '#add_to_order' do
    it { is_expected.to respond_to(:add_to_order).with(2).arguments }

    it 'adds items to order' do
      allow(menu).to receive(:item_available?).and_return(true)
      expect(order).to receive(:add_item)
      takeaway.add_to_order("California Rolls", 1)
    end

    it "raises an error when items don't exit in menu" do
      allow(menu).to receive(:item_available?).and_return(false)
      expect { takeaway.add_to_order("Pizza", 1) }.to raise_error "Please select items from the menu."
    end
  end

  describe '#place_order' do
  

    it { is_expected.to respond_to(:place_order).with(1).arguments }
    
    it 'places an order' do
      expect(test_order).to receive(:finalize_order)
      test_takeaway.place_order(correct_payment)
    end

    it 'raises an error when payment is incorrect' do
      
      allow(test_menu).to receive(:item_available?).and_return(true)
      expect { test_takeaway.place_order(incorrect_payment) }.to raise_error "Incorrect payment."
    end

  end

end
