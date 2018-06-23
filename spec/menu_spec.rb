require 'menu'

describe Menu do

  let(:menu)  { described_class.new }

  describe '#initialize' do
    it 'creates an array of options' do
      expect(menu.options).to match described_class::MENU
    end
  end

  describe '#options' do
    it 'returns a list of dishes and prices' do
      expect(menu.options).to match described_class::MENU
    end
  end

end
