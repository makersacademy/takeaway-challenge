require 'menu'

describe Menu do
    subject(:menu) { described_class.new }
    let(:dish) { double(:dish) }

    it { is_expected.to respond_to(:list) }

    it 'outputs a dish/list of dishes with prices' do
        expect(STDOUT).to receive(:puts).with('Ramen - £1.99')
        menu.add('Ramen - £1.99')
        menu.list
    end

    it 'adds a dish to the menu' do
        expect(menu).to respond_to(:add).with(1).argument
    end

end