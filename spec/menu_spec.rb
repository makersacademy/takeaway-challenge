require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { instance_double('Dish', :name => 'Pizza', :price => 16) }
  let(:dish_list) { [
    instance_double('Dish', :name => 'Pizza', :price => 16, :available? => true),
    instance_double('Dish', :name => 'Sushi', :price => 12, :available? => true),
    instance_double('Dish', :name => 'Fish & Chips', :price => 9, :available? => false),
    instance_double('Dish', :name => 'Thai Green Curry', :price => 14, :available? => true),
    instance_double('Dish', :name => 'Chicken Wings', :price => 7, :available? => true),
    ]
  }

  describe '#add_dish' do
    it 'updates the list of items' do
      expect(menu.add_dish(dish)).to include(dish)
    end
  end

  describe '#list_dishes' do
    context 'returns a formatted list of dishes' do
      it 'with a single dish' do        
        menu.add_dish(dish)
        expect { menu.list_dishes }.to output("Pizza - 16\n").to_stdout
      end

      it 'with multiple dishes' do
        dish_list.each do |dish|
          menu.add_dish(dish)
        end
        expect { menu.list_dishes }.to output("Pizza - 16\n"\
        "Sushi - 12\n"\
        "Fish & Chips - 9\n"\
        "Thai Green Curry - 14\n"\
        "Chicken Wings - 7\n").to_stdout
      end
    end
  end

  describe '#find_by_name' do
    it 'returns an item that matches the name given' do
      dish_list.each do |dish|
        menu.add_dish(dish)
      end
      expect(menu.find_by_name('Pizza').price).to be 16
    end
  end

  describe '#list_available_dishes' do
    it 'returns a formatted list of available dishes' do
      dish_list.each do |dish|
        menu.add_dish(dish)
      end
      expect { menu.list_available_dishes }.to output("Pizza - 16\n"\
      "Sushi - 12\n"\
      "Thai Green Curry - 14\n"\
      "Chicken Wings - 7\n").to_stdout
    end
  end
end
