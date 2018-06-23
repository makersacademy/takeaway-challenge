require 'basket'

describe Basket do
  subject(:basket) { described_class.new }
  let(:dishes) { ['Dosa', 'Dosa', 'Chapatti', 'Chapatti', 'Chapatti'] }

  describe '#add' do
    it 'saves selected dishes' do
      basket.add('Dosa', 2)
      basket.add('Chapatti', 3)
      expect(subject.dishes).to eq dishes
    end
  end
end
