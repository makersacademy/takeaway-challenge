require 'order'

describe Order do
  describe 'initialization' do
    it 'has no items in current order' do
      expect(subject.current_order).to be_empty
    end

    it 'has a list of menu options' do        
      expect(subject.print_menu).to eq({
          "jollof rice": { price: 6 },
          "fried plantain": { price: 3 },
          "jerk chicken": { price: 8 },
          "vegetable patty": { price: 4.5 },
          "ice cream": { price: 4 }
        })
    end    
  end

  describe 'building an order' do
    describe 'adding item to order' do
      it { is_expected.to respond_to(:add_item).with(2).arguments }

    end
  end
end
