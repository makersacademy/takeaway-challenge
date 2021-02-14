require 'order'

describe Order do
  let(:dish_1) { double(:dish_1, :name => "pizza", :price => 10, :class => Dish) }
  let(:dish_2) { double(:dish_2, :name => "burger", :price => 12, :class => Dish) }
  let(:menu_1) { double(:menu_1, :check => dish_1) }
  let(:menu_2) { double(:menu_2, :check => dish_2) }

  subject(:new_order) { described_class.new }

  describe '#view' do
    it 'starts with no dishes added' do
      expect(new_order.view).to eq nil
    end
    it 'displays the total' do
      new_order.add(menu_1, dish_1)
      new_order.add(menu_2, dish_2)
      expect { new_order.view }.to output(/22/).to_stdout
    end
  end

  describe '#add' do
    it 'user can add dishes to an order' do
      new_order.add(menu_1, "pizza")
      expect { new_order.view }.to output(/Pizza/).to_stdout
    end
    context 'when dish not on menu' do
      it 'user will see error' do
        menu = double(:menu, :check => :not_on_menu)
        expect { new_order.add(menu, "pizza") }.to output(/I'm sorry, that dish is not on our menu/).to_stdout
      end
    end
    context 'when dish unavailable' do
      it 'user will see error' do
        menu = double(:menu, :check => :unavailable)
        expect { new_order.add(menu, "pizza") }.to output(/I'm sorry, that dish is currently unavailable/).to_stdout
      end
    end
  end
  # will fail if dish not on menu

  # will fail if dish not available
end
