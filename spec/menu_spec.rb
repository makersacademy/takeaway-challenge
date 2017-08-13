require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context '#initialize' do
    it "should load the dishes" do
      expect(menu.dishes).to eq Menu::DISHES
    end
  end

  context '#print_dishes' do

    it 'should print the dishes to stdout' do
      expect { menu.print_dishes }.to output.to_stdout
    end
  end

end
