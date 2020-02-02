require 'menu'

describe Menu do
  it {is_expected.to respond_to(:list)}
  
  describe '#item' do
    it 'should return a Dish' do
      expect(subject.item(1)).to be_a(Dish)
    end
  end
end