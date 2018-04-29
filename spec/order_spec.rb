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

  describe '#view_summary' do
    # it 'should print the basket' do
    #   order.add_dish("Haddock", 2)
    #   basket = { "Haddock" => 2 }
    #   expect(order.view_summary).to eq "Order summary: #{basket}"
    #   end
      it 'should print the cost' do
        order.add_dish("Haddock", 2)
        basket = { "Haddock" => 2 }
        expect(order.view_summary(10)).to eq "Item summary: #{basket}. Order total: £10"
      end
    end
      # it 'should show the cost of each selection' do
      #   order.add_dish("Haddock", 2)
      #   basket = [{ "Haddock" => 2 }]
      #   expect(order.view_summary(basket)).to eq ["2 x Haddock - £10"]
      # end

  describe '#cost' do
    it 'should multiply the quantity added to the order by the menu price' do
      order.add_dish("Haddock", 2)
      expect(order.cost).to eq 10
    end
  end

end
