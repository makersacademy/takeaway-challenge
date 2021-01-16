require 'menu'

describe Menu do
    subject(:menu) { described_class.new }

    it { is_expected.to respond_to(:list) }

    it 'outputs a dish/list of dishes with prices' do
        expect(STDOUT).to receive(:puts).with('Ramen - £1.99')
        menu.list
    end

end