require 'restaurant'

describe Restaurant do
  subject(:restaurant)  { described_class.new(dispatch) }
  let(:dispatch)        { double :order_dispatch }
  let(:order)           { double :order }

  describe '#view_menu' do
    it 'prints the menu' do
      expect(restaurant.view_menu).to eq described_class::MENU
    end
  end

  describe '#place_order' do
    context 'when placing a correct order' do
      let(:order_details) { { chicken_ruby: 2, kingfisher: 1 } }
      after do
        restaurant.place_order("2 Chicken Ruby", "1 Kingfisher")
      end

      it "parses the customer's order" do
        allow(dispatch).to receive(:place_order)
        expect(restaurant).to receive(:parse_dishes) { order_details }
      end

      it 'calculates the order total' do
        allow(dispatch).to receive(:place_order)
        expect(restaurant).to receive(:calculate_total) { 19.5 }
      end

      it 'places a new order in dispatch' do
        expect(dispatch).to receive(:place_order)
      end
    end

    context 'when ordering an incorrect dish' do
      it 'raises an error' do
        expect { restaurant.place_order("7 Incorrect Dish") }
          .to raise_error(/Sorry, we do not have/)
      end
    end
  end
end
