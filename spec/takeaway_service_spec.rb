require 'takeaway_service'

describe TakeawayService do
  subject(:takeaway) { TakeawayService.new(restaurant_dbl) }
  let(:restaurant_dbl) { double('restaurant', format_menu: formatted_menu) }
  let(:formatted_menu) { "Mock example\nof a\nformatted menu" }
  let(:order_dbl) { double('order', add: add_confirmation) }

  it 'sets the restaurant' do
    expect(takeaway.restaurant).to eq(restaurant_dbl)
  end

  it 'initialises with an empty list of orders' do
    expect(takeaway.orders).to eq []
  end

  it 'initialises with the order_counter set to 1' do
    expect(takeaway.order_counter).to eq(1)
  end

  describe '#print_menu' do
    it "sends a format_menu message to the restaurant" do
      expect(restaurant_dbl).to receive(:format_menu).once
      takeaway.print_menu
    end

    it "prints the formatted menu received from restaurant" do
      expected = "#{formatted_menu}\n"
      expect{ takeaway.print_menu }.to output(expected).to_stdout
    end
  end

  describe '#create_order(order)' do
    it 'adds the order object to the orders list with a unique order number' do
      expect{ takeaway.create_order(order_dbl) }.to change{ takeaway.orders.count }.by(1)
      expect(takeaway.orders[0]).to eq({id: 1, order: order_dbl})
    end

    it 'increases the order_counter by 1' do
      expect{ takeaway.create_order(order_dbl) }.to change{ takeaway.order_counter }.by(1)
    end

    it 'returns the order id' do
      expect(takeaway.create_order(order_dbl)).to eq(1)
    end
  end

  describe '#add_to_order(order_id, dish_name, qty)' do
    it 'takes an order_id, dish_name and qty as arguments' do
      expect(takeaway).to respond_to(add_to_order).with(3).arguments
    end

    context 'when the order id is valid' do
      it 'sends the add message to the relevant order object' do
        takeaway.create_order(order_dbl)
        expect(order_dbl).to receive(:add).once.with('Pepperoni pizza', 1)

        takeaway.add_to_order(1, 'Pepperoni pizza', 1)
      end

      it 'returns the add details received from order.add' do
        expect(takeaway.add_to_order(1, 'Pepperoni pizza', 1)).to eq(order_dbl.add)
      end
    end
  end

end
