require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu)}
  let(:price){6}
  let(:menu) {double(:menu, dishes: dish_1, price: price)}
  let(:dish_1) {double 'chicken'}
  let(:dish_2) {double 'pizza'}

  describe '#initialize' do
    it 'starts with an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#show_menu' do
    it 'allows the user to see a copy of the menu' do
      allow(menu).to receive(:dishes) { {'pizza' => 4} }
      expect(takeaway.show_menu).to eq ({'pizza' => 4})
    end
  end

  describe '#order' do

    context 'making an order' do

      it 'allows the user to order an item from the menu' do
        takeaway.order(dish_1)
        expect(takeaway.basket).to eq ({"#{dish_1} x1"  => price})
      end

      it 'remembers more than one order of the same dish' do
        takeaway.order(dish_1, 3)
        expect(takeaway.basket).to eq ({"#{dish_1} x3"  => price*3})
      end

      it 'remembers orders consisting of multiple different items' do
        takeaway.order(dish_1)
        takeaway.order(dish_2, 2)
        expect(takeaway.basket).to eq ({"#{dish_1} x1"  => price, "#{dish_2} x2" => price*2})
      end

      it 'repeats your orders back to you as you make them' do
        expect(takeaway.order(dish_1)).to eq "You ordered #{dish_1} x1"
      end

      it 'allows the user to reset their basket and start again' do
        takeaway.order(dish_1, 15)
        takeaway.reset
        expect(takeaway.basket).to be_empty
        expect(takeaway.order_cost).to eq 0
      end
    end

    context 'pricing an order' do

      describe '#total' do

        before do
          takeaway.order(dish_1)
          takeaway.order(dish_2, 3)
        end

        it 'will give you the total price of your order' do
          expect(takeaway.total).to eq "Total order cost: £#{24}"
        end

        it 'will let user check the total matches the order sum' do
          expect(takeaway.check_total).to be true
        end
      end
    end

    context 'text messaging' do

      describe '#send_text' do
        before do
          allow(takeaway).to receive(:send_text)
          takeaway.order(dish_1, 2)
        end

        it 'sends a text message to confirm order' do
          message = "Your order comes to £12, and will be with you in 1 hour"
          expect(takeaway).to receive(:send_text).with(message)
          takeaway.complete_order
        end
      end
    end
  end
end
