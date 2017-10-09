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
    subject(:wrong_confirmation) { 10 }

    context '2 dishes ordered' do
      before do
        takeaway.select(dish, quantity)
        takeaway.select(dish1, quantity)
      end

      it 'shows the order total' do
        expect(takeaway.order_total).to eq total
      end

      it 'displays the order and the cost' do
        expect(takeaway.order_summary).to eq "Thanks! Your order, total £#{total}, will be delivered by #{takeaway.delivery_time}!"
      end

      #   expect it to print out the confirmation
      #   expect it to reset the order hash to {}
      #   expect it to call the text_confirmation method

      it 'raises error if order confirmation is correct' do
        expect { takeaway.place_order(wrong_confirmation) }.to raise_error "Incorrect total entered, please try again"
      end
    end

    describe 'text_confirmation' do
      it 'has a text confirmation method' do

        expect(takeaway).to respond_to :text_confirmation
      end
    end
  end
end
