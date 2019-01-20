require 'Menu'

RSpec.describe Menu do
  let(:menu) { described_class.new }

  context 'list of dishes' do
    it 'checks whether list of dishes exist' do
      expect(menu).to respond_to(:list_of_dishes)
    end

    it 'checks whether list includes dishes and prices' do
      expect(menu.list_of_dishes).to eq(menu.food_we_offer)
    end

    it 'responds to dishes selector' do
      expect(menu).to respond_to(:select_dish).with(2).arguments
    end

    it 'allows to select a number of dishes' do
      food_we_offer = double('food on menu')
      your_order = double('order')
      dish = double('dish')
      quantity = double('quantity')
      expect(your_order).to receive(:push)
      test_menu = Menu.new(food_we_offer, your_order)
      test_menu.select_dish(dish, quantity)
    end
  end

end
