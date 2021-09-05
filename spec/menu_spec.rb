require 'menu'
require 'dish'

describe Menu do

  let(:dish1) { Dish.new("Hash brown", 0.99) }
  let(:dish2) { Dish.new("Cup of tea", 0.99) }

  context 'updating menu' do
    it 'add dish to menu' do
      subject.add_to_menu(dish1)
      subject.add_to_menu(dish2)
      expect(subject.list_of_dishes).to eq([dish1.itemise, dish2.itemise])
    end
  end 

  context 'viewing menu' do
    it 'displays menu' do
      subject.add_to_menu(dish1)
      subject.add_to_menu(dish2)
      expect(subject.view_menu).to eq("TD-Dish: #{dish1.name} // Price: £#{dish1.price}\nTD-Dish: #{dish2.name} // Price: £#{dish2.price}")
    end

    it 'default menu available if no dishes added' do
      subject.access_menu
      expect(subject.list_of_dishes).to eq(described_class::DEFAULT_MENU)
    end
  end
end
