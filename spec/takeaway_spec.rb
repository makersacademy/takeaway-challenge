require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu_class: menu_class, sum_class: sum_class, text_class: text_class) }

  let(:menu_class) { double(:menu_class, new: fake_menu) }
  let(:fake_menu) { double(:fake_menu, list: [{name: "Chicken", quantity: 1, price: 4.5}]) }
  let(:sum_class) { double(:sum_class, new: fake_sum) }
  let(:fake_sum) { double(:fake_sum) }
  let(:text_class) { double(:text_class, new: fake_text) }
  let(:fake_text) { double(:fake_text) }

  # before do
  #   allow(takeaway).to receive(:check_out)
  # end

    describe '#initialize' do
      it 'shows the menu' do
        expect(takeaway.menu).to eq fake_menu
      end
      it 'has a sum' do
        expect(takeaway.sum).to eq fake_sum
      end
      it 'returns an empty basket' do
        expect(takeaway.basket).to eq []
      end
      it 'initializes text' do
        expect(takeaway.text).to eq fake_text
      end
    end

    describe '#menu_list' do
      context 'when viewing menu' do
        it 'returns menu' do
          expect(fake_menu).to receive(:list)
          takeaway.menu_list
        end
      end
    end

    describe '#order' do
      context 'when adding a dish to the basket' do
        it 'adds a dish' do
          expect { takeaway.order('Chicken') }.to change { takeaway.basket.count }
        end
        it 'adds to basket' do
          expect(takeaway.order('Chips')).to eq takeaway.basket
        end
      end
    end

    describe '#total' do
      it 'returns total' do
        expect(fake_sum).to receive(:total)
        takeaway.total
      end
    end

    # describe '#menu' do
    #   context 'when requesting to see the menu' do
    #     it 'should show the menu' do
    #       expect(takeaway.menu).to eq takeaway.menu
    #     end
    #   end
    # end
    #
    # describe '#order' do
    #   context 'when selecting a dish' do

    #   end
    #   context 'when adding dishes to your order' do
    #     it 'order total should be the sum of dishes added' do
    #       takeaway.order('Chips')
    #       takeaway.order('Chips')
    #       expect(takeaway.total).to eq 4
    #     end
    #   end
    # end
    #
    # describe '#total' do
    #   context 'when checking order total' do
    #     it 'should return order total' do
    #       expect(takeaway.total).to eq takeaway.total
    #     end
    #   end
    # end
    #
    describe '#empty_basket' do
      context 'when trying to checkout with an empty basket' do
        it 'should raise an error' do
          expect { takeaway.empty_basket? }.to raise_error "You haven't ordered anything!"
        end
      end
    end


end
