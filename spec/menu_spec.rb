require 'menu'
require 'dish'

describe Menu do
    subject(:menu) { described_class.new }
    # let(:dish) { double(:dish) }
    let(:dish) { Dish.new(44, 'Ramen', 1.99) }

    it { is_expected.to respond_to(:list) }

    it 'outputs a dish/list of dishes with prices' do
        expect(STDOUT).to receive(:puts).with('(44) Ramen - £1.99')
        # ramen = Dish.new('Ramen', 1.99)
        menu.add(dish)
        menu.list
    end

    it 'adds a dish to the menu' do
        expect(menu).to respond_to(:add).with(1).argument
    end

end