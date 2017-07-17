require 'take_away_menu'

  describe TakeAway do

subject(:takeaway) { described_class.new }
    describe '#menu' do
      it 'retuns an array of all the available food items' do
        expect(takeaway.menu).to eq({ tuna: 4, frog: 1, lamb: 2, pork: 3 })
      end
    end

    describe '#check_order' do
      it 'returns a list of all the items added to the order' do
        takeaway.add_item_to_order("tuna", 3)
        takeaway.add_item_to_order("frog", 1)
        expect(takeaway.check_order).to eq nil
      end
    end

    describe '#print_menu' do
      it "prints out a menu and returns a menu hash" do
      expect(takeaway.print_menu).to eq({ tuna: 4, frog: 1, lamb: 2, pork: 3 })
    end
    end

    describe '#add_item_to_order' do
      it 'allows users to select items and specify an option quanity' do
        expect(takeaway.add_item_to_order("tuna", 3)).to eq({ tuna: [4, 3] })
      end

      it 'raises an error if the iteam is not on the menu' do
        message = "Sorry Sweet Potato is not available."
        expect { takeaway.add_item_to_order("Sweet Potato") }.to raise_error message
      end

      it ' rasise an error if a negitive number is given for quantity' do
        message = "Please enter a positive quantity"
        expect { takeaway.add_item_to_order("tuna", -1) }.to raise_error message
      end
    end
end
