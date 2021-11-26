require 'takeaway'

describe Takeaway do 
  subject { Takeaway.new(restaurant) }
  let(:restaurant) { 'Bamboo kitchen' }
  let(:bad_item) { 'DEFINITELY NOT AN ITEM ON THE MENU' }
  let(:good_item) { :'Spring Rolls' }
  context 'When initialized' do 
    it 'has a name' do 
      expect(subject.name).to eq 'Bamboo kitchen'
    end
    it 'has a menu' do 
      expect(subject.see_menu).not_to be_empty
    end
    it 'has an empty order basket' do 
      expect(subject.basket).to be_empty
    end
  end

  describe '#see_menu' do 
    it 'prints the full list of menu item' do 
      expect(subject.see_menu.count).to eq subject.menu.size
    end
  end

  describe '#order' do 
    context 'item is on the menu' do 
      it 'adds the item to the basket' do 
        subject.order(good_item)
        expect(subject.basket.find { |item| item[good_item] }).to_not be_nil
      end
    end

    context 'item is not on the menu' do 
      it 'raises an error' do 
        expect { subject.order(bad_item) }.to raise_error "Item is not on the menu"
      end
    end

  end
end
