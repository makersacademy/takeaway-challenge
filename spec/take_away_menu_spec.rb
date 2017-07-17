require 'take_away_menu'

  describe TakeAwayMenu do


    describe '#menu' do
      it 'retuns an array of all the available food items' do
        expect(subject.menu).to eq({ tuna: 4, frog: 1, lamb: 2, pork: 3 })
      end
    end

    describe '#check_order' do
      it 'returns a list of all the items added to the order' do
        subject.add_item_to_order("tuna", 3)
        subject.add_item_to_order("frog", 1)
        expect(subject.check_order).to eq nil
      end
    end

    describe '#print_menu' do
      it "prints out a menu and returns a menu hash" do
      expect(subject.print_menu).to eq({ tuna: 4, frog: 1, lamb: 2, pork: 3 })
    end
    end

    describe '#add_item_to_order' do
      it 'allows users to select items and specify an option quanity' do
        expect(subject.add_item_to_order("tuna", 3)).to eq({ tuna: [4, 3] })
      end

      it 'raises an error if the iteam is not on the menu' do
        expect { subject.add_item_to_order("Sweet Potato") }.to raise_error "Sorry Sweet Potato is not available."
      end

      it ' rasise an error if a negitive number is given for quantity' do
        expect { subject.add_item_to_order("tuna", -1) }.to raise_error "Please enter a positive quantity"
      end
    end
end
