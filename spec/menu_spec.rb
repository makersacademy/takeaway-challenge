require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe '.steakhouse' do
    context 'when viewing steakhouse menu' do
      it 'should return steakhouse menu' do
        expect(menu.steakhouse).to eq menu.steakhouse
      end
    end
  end
end
