require 'menu'

describe Menu do

  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.dishes).not_to be_empty
    end

    it 'starts with an empty order' do
      expect(subject.order).to be_empty
    end
  end
end
