require './docs/order'

describe Order do
  let(:menu) { double menu: { "Haddock" => 5, "Cod" => 6 } }
  # let(:basket) { { } }
  subject(:order) { described_class.new(menu) }

  describe '#intialize' do
    it 'should have an instance of the menu class' do
      expect(order.menu).to eq menu
    end
    it 'should have an empty basket' do
      expect(order.basket).to be_empty
    end
  end

  describe '#display_menu' do
    it 'should display the menu' do
      allow(menu).to receive(:show_menu) { ["Haddock - £5", "Cod - £6"] }
      expect(order.display_menu).to eq menu.show_menu
    end
  end

  describe '#add_dish' do
    it 'should add the selection to the basket' do
      order.add_dish("Haddock", 2)
      expect(order.basket).to include("Haddock" => 2)
    end
  end

  describe '#cost' do
    it 'should multiply the quantity added to the order by the menu price' do
      order.add_dish("Haddock", 2)
      expect(order.cost).to eq "Order total: £10"
    end
  end

  describe '#enter_payment' do
    it 'should return the payment amount entered' do
      expect(order.enter_payment(10)). to eq "£10"
    end
  end

  describe "#payment_accepted?" do
    it 'should return true if the payment amount equals the order cost' do
      expect(order.payment_accepted?).to be true
    end
    # it 'should raise an error if the payment amount is not correct' do
    #   expect(order.payment_accepted?).to raise
    # end
  end

end
