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

end