require 'menu'

describe Menu do
subject(:menu) { described_class.new }

  context 'by default' do
    it 'has an array' do
      expect(menu.dishes).to be_a(Array)
    end
  end
end
