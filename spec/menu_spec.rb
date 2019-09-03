require 'menu'
require 'dish'

describe Menu do

  it 'initialize a new menu' do
    is_expected.to respond_to(:view_menu)
    is_expected.to respond_to(:add_dish)
  end

  it 'when initialize without a list of dishes' do
    expect(subject.dishes).to eq Menu::DEFAULT_DISHES
  end

  describe '#view_menu' do

    it 'shows the menu' do
      dishes = Menu::DEFAULT_DISHES
      expect(subject.view_menu).to eq dishes
    end

  end

  describe '#add_dish' do

    it 'add dishes into menu' do
      new_dish = Dish.new("Rosted Potato", 4)
      subject.add_dish(new_dish)
      expect(subject.dishes).to include(new_dish)
    end

    it 'raise an error when adding another thing instead of a dish' do
      new_dish = "blah blah"
      expect { subject.add_dish(new_dish)
      }.to raise_error Menu::ERROR_IS_NOT_A_DISH
    end

    it 'ensure that the price of dish is greater than 0' do
      new_dish = Dish.new("bread", 0)
      expect {subject.add_dish(new_dish)
      }.to raise_error Menu::ERROR_INVALID_PRICE
    end

  end

end
