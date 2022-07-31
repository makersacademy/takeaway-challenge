require 'menu'

describe Menu do
  let(:dish_price) { rand(1..5) }
  let(:quantity) { rand(1..10) }
  let(:dish_total) { dish_price * quantity }
  let(:dish) { double("dish", :read_name => "dish", :read_price => dish_price, :amount => quantity, :dish_total => dish_total) }
  let(:dish2) { double("dish2", :read_name => "dish2", :read_price => dish_price, :amount => quantity, :dish_total => dish_total) }
  let(:menu) { described_class.new }

  context '#add_dish_to_menulist' do
    it 'can add dishes to menulist' do
      menu.add_dish_to_menulist(dish)
      expect(menu.display).to include(dish)
    end
  end

  before do 
    menu.add_dish_to_menulist(dish)
  end

  context '#display' do
    it 'can display a list of dishes' do
      expect(menu.display).to match_array(dish)
    end
  end

  context '#choose' do
    it { is_expected.to respond_to(:choose).with(2).arguments }
    
    it 'raises an error if chosen dish is not in menu' do
      expect { menu.choose(dish2,quantity) }.to raise_error("Dish not in menu")
    end
  end

  context '#verify_order_total' do
    it 'can verify my order total matches the sum of the dishes in my order' do
      menu.add_dish_to_menulist(dish2)
      menu.choose(dish, quantity)
      menu.choose(dish2, quantity)
      expect(menu.verify_order_total).to eq(true)
    end
  end

end
