require_relative '../lib/menu'

describe Menu do

  let(:dish_double) {
    double :dish,
    name: :name_of_dish,
    price: :price_of_dish
  }
  let(:dish_class_double) { double :dish_class, new: dish_double }
  let(:menu) { Menu.new(dish_class_double) }

  describe '#initialize' do

    it 'creates a new menu with an empty list of available dishes' do
      expect(menu.available_dishes).to be_empty
    end

  end

  describe '#new_dish' do

    it 'creates a new dish adds it to available dishes' do
      expect { menu.new_dish(:name_of_dish, :price_of_dish) }.to change { menu.available_dishes }.to end_with(dish_double)
    end

  end

  describe 'view_menu' do

    it 'displays available dishes' do
      menu.new_dish(:name_of_dish, :price_of_dish)
      allow(dish_double).to receive(:[]).with(:name).and_return(:name_of_dish)
      allow(dish_double).to receive(:[]).with(:price).and_return(:price_of_dish)
      expect { menu.view_menu }.to output(
        "name_of_dish: £ price_of_dish\n"
      ).to_stdout 
    end

  end

  describe 'select_dish' do

  end
end
