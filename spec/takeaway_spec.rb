require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu, order)}

  let(:menu) { double :menu, print_menu: printed_options, meals_list: {"nachos"=> 5.00}}
  let(:printed_options) {["Tacos £3.50"]}
  let(:order) { double :order }
  let(:message) { double :message }

    describe '#show_menu' do

      it "prints menu" do
        expect(takeaway.show_menu).to eq printed_options
      end

    end

    describe '#place_order' do

      it 'raises an error when a meal is not on the menu' do
        allow(menu).to receive(:has_meal?).and_return(false)
        message =  "Beer is not on the menu"
        expect{ takeaway.place_order("beer") }.to raise_error message
      end

    end

    context 'meal is on the menu' do

      before do
        allow(menu).to receive(:has_meal?).and_return(true)
        allow(order).to receive(:add_meals)
      end

      describe '#place_order' do
        it 'can order any number of meals' do
          expect(order).to receive(:add_meals).twice
          takeaway.place_order("nachos")
          takeaway.place_order("nachos")
        end
      end

      describe '#basket contents' do
        it 'shows what meals are in your basket' do
          allow(order).to receive(:basket_empty?).and_return(false)
          allow(order).to receive(:basket).and_return("nachos"=> 1)
          takeaway.place_order("nachos")
          expect(takeaway.basket_contents).to eq "nachos"=> 1
        end
      end
    end

    context '#basket is empty' do

      before do
        allow(order).to receive(:basket_empty?).and_return(true)
      end

      describe '#basket_contents' do

        it 'returns message of empty basket if empty' do
          expect(takeaway.basket_contents).to eq "Basket is empty"
        end

      end

      describe '#confirm_order' do

        it 'raises an error if no order placed' do
          message = 'No orders have been added'
          expect{ takeaway.confirm_order }.to raise_error message
        end

        it 'sends a message if order is correct' do
          expect(message).to receive(:send_text)
          message.send_text("test")
        end

      end

    end
end
