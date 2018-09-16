require './lib/take_away'
describe TakeAway do
  let(:menu) { double :menu, display_menu: nil }
  let(:dish) { double :dish }
  let(:dish2) { double :dish2 }
  let(:price) { double :price }
  subject(:takeaway) { described_class.new(menu) }
  describe "#initialize" do
    it 'creates an empty list of orders' do
      expect(takeaway.order_list).to eq []
    end
    it 'creates a menu' do
      expect(takeaway.menu).to eq menu
    end
  end

  describe '#display_menu' do
    it 'calls method display menu on menu instance' do
      expect(takeaway.menu).to respond_to(:display_menu)
      takeaway.display_menu
    end
  end

  describe '#order_dish' do
    context "when the dish is not in the menu" do
      it 'raises an error' do
        allow(menu).to receive(:dish_included?).with(dish).and_return(false)
        expect { takeaway.order(dish) }.to raise_error "This dish is not in our menu"
      end
    end

    context "when the dish is in the menu" do
      before do
        allow(menu).to receive(:dish_included?).with(dish).and_return(true)
      end
      it 'confirms that a dish has been added to the order list' do
        allow(menu).to receive(:dish_price).with(dish).and_return(4)
        expect { takeaway.order(dish) }.to output("1 #{dish} has been added to your order list\n").to_stdout
      end
      it 'confirms that 2 dishes have been added to the order list' do
        allow(menu).to receive(:dish_price).with(dish).and_return(4)
        expect { takeaway.order(dish, 2) }.to output("2 #{dish}s have been added to your order list\n").to_stdout
      end
      it 'adds 1 dish to the order list' do
        allow(menu).to receive(:dish_price).with(dish).and_return(4)
        takeaway.order(dish)
        expect(takeaway.order_list).to eq [{ dish: dish, amount: 1, price: 4 }]
      end
      it 'adds 2 dishes to the order list' do
        allow(menu).to receive(:dish_price).with(dish).and_return(4)
        takeaway.order(dish, 2)
        expect(takeaway.order_list).to eq [{ dish: dish, amount: 2, price: 8 }]
      end
    end
  end

  describe '#order_summary' do
    it 'informs that nothing added yet when order is empty' do
      expect { takeaway.order_summary } .to output("You have not added anything yet\n").to_stdout
    end
    it 'shows a summary of the order list' do
      allow(menu).to receive(:dish_included?).with(dish).and_return(true)
      allow(menu).to receive(:dish_price).with(dish).and_return(4)
      allow(takeaway).to receive(:calculate_price).with(dish, 2).and_return(8)
      takeaway.order(dish, 2)
      expect { takeaway.order_summary }.to output("2 #{dish}(s), £8\n").to_stdout
    end
  end

  describe '#print_total_price' do
    it 'shows the total price of the current order' do
      allow(menu).to receive(:dish_included?).with(dish).and_return(true)
      allow(menu).to receive(:dish_included?).with(dish2).and_return(true)
      allow(menu).to receive(:dish_price).with(dish).and_return(4)
      allow(menu).to receive(:dish_price).with(dish2).and_return(3)
      takeaway.order(dish)
      takeaway.order(dish2, 2)
      expect { takeaway.print_total_price }.to output("The total price is £10.\n").to_stdout
    end
  end
end
