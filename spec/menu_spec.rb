require 'menu'

describe Menu do
  describe '#initialize' do
    it 'has a list of dishes upon initialization' do
      expect(subject.dishes).to_not eq nil
    end
  end
end