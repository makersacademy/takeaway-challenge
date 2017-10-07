require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  # let(:dishes) { double(:dishes, name: "Chop Suey", price: 15.99) }
  let(:list) do
    {
      "Chop Suey" => 15.99,
      "Thai Curry" => 11.99,
      "Singapore Noodles" => 9.99
    }
  end

  describe "showing dishes" do
    it 'is instantiated with a menu' do
      expect(takeaway.menu).to be_instance_of Dishes
    end

    it 'prints a menu' do
      expect(takeaway.print_menu).to include(list)
    end
  end

  describe 'selecting dishes' do
    subject(:dish) { "Chop Suey" }
    subject(:quantity) { 2 }
    it 'adds a dish to the current order' do
      takeaway.select(dish, quantity)
      expect(takeaway.current_order).to include(dish)
    end

    it 'can add multiple dishes to the current order' do
      takeaway.select(dish, quantity)
      expect(takeaway.order_total).to eq(takeaway.current_order[dish])

    end
  end

  describe 'manages the order' do
    subject(:dish) { "Chop Suey" }
    subject(:dish1) { "Thai Curry" }
    subject(:quantity) { 2 }
    subject(:total) { takeaway.current_order.values.sum }

    context '2 dishes ordered' do
      before do
        takeaway.select(dish, quantity)
        takeaway.select(dish1, quantity)
      end

      it 'shows the order total' do
        expect(takeaway.order_total).to eq total
      end

      it 'displays the order and the cost' do
        expect(takeaway.place_order).to eq   "Thanks! Your order, total of #{total}, is being processed and will be delivered by #{takeaway.delivery_time}"
      end

    end
  end
end
