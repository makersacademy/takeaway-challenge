require_relative '../lib/menu'

describe Menu do

  let(:dish_double) {
    double :dish,
    name: :name_of_dish,
    price: :price_of_dish
  }
  let(:dish_class_double) { double :dish_class, new: dish_double }
  let(:basket_double) { double :basket }
  let(:basket_class_double) { double :basket_class, new: basket_double }
  let(:menu) { Menu.new(dish_class_double, basket_double) }

  describe '#initialize' do

    it 'creates a new menu with an empty list of available dishes' do
      expect(menu.available_dishes).to be_empty
    end

    it 'initializes with a dish class' do
      expect(menu.dish_class).to be dish_class_double
    end

    it 'initializes with a new basket' do
      expect(menu.basket).to be basket_double
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
      allow(dish_double).to receive(:[]).with(:name).and_return(:name_of_dish) # no need for [] syntax anymore
      allow(dish_double).to receive(:[]).with(:price).and_return(:price_of_dish)
      expect { menu.view_menu }.to output(
        "name_of_dish: £ price_of_dish\n"
      ).to_stdout 
    end

  end

  describe 'select_dish' do

    ## Review this to confirm not that test is testing Menu#select_dish,
    ## and not just testing double behaviour
    it 'adds desired number of named dish to basket' do
      desired_number = rand(5)
      basket = []
      desired_number.times { basket << dish_double }
      menu.new_dish(:name_of_dish, :price_of_dish)
      allow(basket_double).to receive(:add_to_basket).with(dish_double).and_return([dish_double])
      allow(basket_double).to receive(:basket_contents).and_return(basket)
      expect(menu.select_dish(:name_of_dish, desired_number)).to eq(basket)
    end

  end
end
