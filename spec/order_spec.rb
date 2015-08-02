require 'order'

describe Order do 

  let (:menu){double :menu, dishes: {biriyani: 5.00, uk_curry: 6.00, cheeseburger: 4.00, pizza: 5.00, side_of_salmonella: 1.95}}
  before :each do 
    @subject = Order.new menu
  end

  context 'when created' do 
    it 'has a selection hash' do
      expect(@subject.selection).to be_a Hash
    end

    it 'the selection hash is empty' do 
      expect(@subject.selection).to be_empty
    end

    it 'has a menu to choose from' do
      expect(@subject.menu).to be menu
    end
  end

  describe '#add_item' do 
    it 'can add a dish from a menu into its selection hash' do
      @subject.add_item :biriyani, 1
      expect(@subject.selection).to include :biriyani
    end

    it 'will have the appropriate quantity as its value' do 
      @subject.add_item :biriyani, 1
      expect(@subject.selection[:biriyani]).to eq 1
    end

    it 'returns an error message when dish does not exist on the menu' do
      expect(@subject.add_item :hamburger, 1).to eq "That item is not on the menu"
    end

    describe '#on_menu?' do 
      it 'returns true if an item is on the menu' do 
        expect(@subject.on_menu? :uk_curry).to be true
      end

      it 'returns false if an item is not on the menu' do 
        expect(@subject.on_menu? :hamburger).to be false
      end
    end
  end

  describe '#place_order' do 
    context 'when given amount is correct' do 
      it 'it returns a message saying the order was successfully placed' do
        allow(@subject).to receive(:selection).and_return({biriyani: 1, cheeseburger: 2})
        expect(@subject.place_order 13).to eq "Thankyou! Order was successfully placed."
      end
    end

    context 'when given amount is incorrect' do
      it 'it returns a message saying the given amount is incorrect and suggests a calculated total' do 
        allow(@subject).to receive(:selection).and_return({biriyani: 1, cheeseburger: 2})
        expect(@subject.place_order 10).to eq "Order unsuccessful. Total should equal 13.0"
      end
    end

    describe '#correct_amount?' do 
      it 'returns true when given amount matches #build_order total' do
        @subject.add_item :biriyani, 2
        expect(@subject.correct_amount? 10).to be true
      end

      it 'returns false when given amount that does not match #build_order total' do 
        @subject.add_item :biriyani, 2
        expect(@subject.correct_amount? 5).to be false
      end
    end

    describe '#build_order' do 
      it 'returns a hash containing the selection hash and the TRUE total amount' do
        allow(@subject).to receive(:selection).and_return({biriyani: 2, side_of_salmonella: 1})
        expect(@subject.build_order).to eq({ {biriyani: 2, side_of_salmonella: 1} => 11.95 })
      end
    end

  end

end