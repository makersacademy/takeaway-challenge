require 'menu'

describe Menu do
subject(:menu) { described_class.new }

  context 'by default' do
    it 'has an array' do
      expect(menu.dishes).to be_a(Array)
    end

    it 'has a dish and price' do
      expect(menu.dishes).to include( :dish => "Egg fried rice", :price => 4 )
    end
  end

  describe '#view' do
    it 'displays dish and price' do
      expect { menu.view }.to output.to_stdout
    end
  end
end
