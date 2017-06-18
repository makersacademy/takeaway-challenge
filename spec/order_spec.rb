require 'order'

describe Order do
  let(:menu) do
    menu = double(:menu)
    allow(menu).to receive(:contents) { { "Horse Burger" => 8.99, "Horse Surprise" => 12.99 } }
    allow(menu).to receive(:view)     { puts "Horse Burger: 8.99" }
    menu
  end

  let(:order)        { described_class.new(menu) }
  let(:delivery_time) { Time.new + (60 * 60) }

  describe 'Initialization' do
    it { is_expected.to respond_to :basket }

    context 'Order basket' do
      it 'is an array' do
        expect(order.basket).to be_a Array
      end

      it 'is empty when initialized' do
        expect(order.basket).to be_empty
      end
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }
  end

  context 'Adding menu items to the order' do
    it 'adds the selected item when found' do
      order.add("Horse Burger")
      expect(order.basket).to include("Horse Burger" => 8.99)
    end

    it 'informs the user the item has been added' do
      expect(order.add("Horse Burger")). to eq "Horse Burger (8.99) has been added to your basket."
    end
  end

  context 'Adding non-existant items' do
    it 'raises an error' do
      expect { order.add("Chicken Burger") }.to raise_error("Chicken Burger not found")
    end
  end

  describe '#show_menu' do
    it { is_expected.to respond_to(:show_menu) }

    it "outputs the items on the menu" do
      expect { order.show_menu }.to output(/#{menu.contents.keys.first}: #{menu.contents.values.first}/).to_stdout
    end
  end

  describe '#view' do
    it { is_expected.to respond_to(:view) }
    it { is_expected.to respond_to(:total) }

    context 'When the basket is empty' do
      it 'raises an error' do
        expect { order.view }.to raise_error("Your basket is empty")
      end
    end

    context 'When the basket isn\'t empty' do
      before do
        order.add("Horse Burger")
        order.add("Horse Surprise")
      end

      it 'prints the contents of the basket' do
        expect { order.view }.to output(/#{menu.contents.keys.first}: #{menu.contents.values.first}/).to_stdout
      end

      it 'returns the order total' do
        expect(order.view).to eq "Your total is £21.98"
      end

      it 'updates the total' do
        order.view
        expect(order.total).to eq 21.98
      end
    end
  end

  describe '#submit' do
    it { is_expected.to respond_to(:submit) }

    context 'When the basket is empty' do
      it 'raises an error' do
        expect { order.submit }.to raise_error("Add some items to your basket first")
      end
    end

    context 'When the order hasn\'t been viewed first' do
      before do
        order.add("Horse Burger")
        order.add("Horse Surprise")
      end

      it 'raises an error' do
        expect { order.submit }.to raise_error("Check your basket first to confirm (order.view)")
      end
    end

    context 'When an order is ready to be submitted' do
      before do
        order.add("Horse Burger")
        order.add("Horse Surprise")
        order.view
      end

      it 'sends a confirmation text' do
        expect(order.submit).to eq "Thanks for ordering from Harold's House of Horse! Your order will be with you by #{delivery_time.hour}:#{delivery_time.min}"
      end
    end
  end
end

# Move dishes into a hash in the menu
# Add an Order class that has a basket
# - Order.add(item_name)
# - Order.basket - shows basket contents
# - Order.confirm - marks the order as acceptable
# - Order.submit - sends the text
