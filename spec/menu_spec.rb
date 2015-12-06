require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#show' do
    it 'shows a list of available dishes with prices' do
      expect(menu.show).to include{'Classic Fondue : £13.0'}
    end
  end
end
