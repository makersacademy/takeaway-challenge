require 'menu'

describe Menu do
  let(:subject) {described_class.new}

  describe '#dishes' do
    it 'has an array when instantiated' do
      expect(subject.dishes).to be_an(Array)
    end
    it 'the dishes array is not empty' do
      expect(subject.dishes).not_to be_empty
    end
  end
end
