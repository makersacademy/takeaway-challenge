require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context 'by default' do
    it 'has an array' do
      expect(menu.dishes).to be_a(Array)
    end

    it 'has a dish and price' do
      expect(menu.dishes).to include(:dish => "Egg fried rice", :price => 3)
    end
  end

  describe '#view' do
    it 'displays a list of dishes and prices' do
      expect { menu.view }.to output("Egg fried rice: £3\nSweet & sour fish: £6\nMorning glory: £4\n").to_stdout
    end
  end
end
