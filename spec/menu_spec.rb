require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context 'by default' do
    it 'is an array' do
      expect(menu.dishes).to be_a(Array)
    end

    it 'has dishes and their prices' do
      expect(menu.dishes).to include({:dish => "Egg fried rice", :price => 3}, {dish: "Sweet & sour fish", price: 6}, { dish: "Morning glory", price: 4 })
    end
  end

  describe '#view' do
    it 'displays a list of dishes and prices' do
      expect { menu.view }.to output("1. Egg fried rice: £3\n2. Sweet & sour fish: £6\n3. Morning glory: £4\n").to_stdout
    end
  end
end
