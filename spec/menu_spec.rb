require 'menu'

describe Menu do

  describe '#initialize' do
    it 'creates an array of options' do
      expect(subject.options).to match described_class::MENU
    end
  end

  describe '#options' do
    it 'returns a list of food and price' do
      expect(subject.options).to match described_class::MENU
    end
  end

end
