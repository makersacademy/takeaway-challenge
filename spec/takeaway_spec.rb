require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
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
      expect(takeaway.order.current).to include(dish)
    end

    it 'can add multiple dishes to the current order' do
      takeaway.select(dish, quantity)
      expect(takeaway.order_total).to eq(takeaway.order.current[dish])

    end
  end

  describe 'manages the order' do
    subject(:dish) { "Chop Suey" }
    subject(:dish1) { "Thai Curry" }
    subject(:quantity) { 2 }
    subject(:total) { takeaway.order_total }
    subject(:wrong_confirmation) { 10 }

    it 'is instantiated with an empty order' do
      expect(takeaway.order).to be_instance_of Order
    end

    context '2 dishes ordered' do
      before do
        takeaway.select(dish, quantity)
        takeaway.select(dish1, quantity)
      end

      it 'shows the order total' do
        expect(takeaway.order_total).to eq total
      end

      it 'raises error if order confirmation is correct' do
        expect { takeaway.place_order(wrong_confirmation) }.to raise_error "Incorrect total entered, please try again"
      end
    end
  end
end
