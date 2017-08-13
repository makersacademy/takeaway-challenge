require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context '#initialize' do
    it 'should load the dishes' do
      expect(menu.dishes).to eq Menu::DISHES
    end

    it 'should start with an empty order' do
      expect(menu.order).to be_empty
    end
  end

  context '#print_dishes' do
    it 'should print the dishes to stdout' do
      expect { menu.print_dishes }.to output.to_stdout
    end
  end

  context '#dish_order' do
    it 'should store the order' do
      menu.dish_order(:pizza)
      expect(menu.order).to include(:pizza)
    end

    it 'should raise an error if not on the list' do
      message = "Sorry, that dish isn't on the menu"
      expect { menu.dish_order("something") }.to raise_error message
    end

  end

  context '#order_amount' do
    it 'should calculate the total order amount' do
      menu.dish_order(:pizza)
      menu.dish_order(:pizza)
      expect(menu.order_amount).to eq 10
    end
  end

  # context '#show_order' do
  #   it "should show the amount of items per dish" do
  #     menu.dish_order(:chicken_chow_mein)
  #     menu.dish_order(:chicken_chow_mein)
  #     expect(menu.show_order).to include(chicken_chow_mein: 2)
  #   end
  # end

end
