require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:dish) { double("dish", :read_name => "dish", :read_price => 2) }
  let(:dish2) { double("dish2", :read_name => "dish2", :read_price => 3)}

  context '#display' do
    it 'can display a list of dishes (with prices)' do
      menu.menulist << dish
      expect(menu.display.length).to eq(1)
    end

  end

  context '#choose' do
    it 'can choose a single dish from the menu' do
      menu.menulist << dish
      menu.choose(dish, 1)
      expect(menu.order.length).to be(1)
    end
    
    it 'can choose multiple dishes from the menu' do
      menu.menulist << dish
      menu.menulist << dish2
      menu.choose(dish, 1)
      menu.choose(dish2, 1)
      expect(menu.order.length).to be(2)
    end
  end

  context '#verify' do
    it 'can verify my order total matches the sum of the dishes in my order' do
      menu.menulist << dish
      menu.menulist << dish2
      menu.choose(dish, dish2)
      expect(menu.verify).to eq(true)
    end
  end

end