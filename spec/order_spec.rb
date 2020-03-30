require 'order'

describe Order do

  let(:new_menu) { Menu.new }
  let(:burger) { MenuItem.new("burger", 9) }
  
  
  context 'new order' do
    
    it 'new order has empty array' do
      expect(subject.basket).to eq []
    end
  end

  context 'add menu item to basket' do
    
    it 'responds to #add_item' do
      expect(subject).to respond_to(:add_item)
    end

    it 'adds new item to basket' do
      new_menu.add_new_item()
      expect(subject.add_item(new_menu, "burger")).to be [[burger]]
    end
  end
end
