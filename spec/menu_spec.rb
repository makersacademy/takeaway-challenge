require 'menu'

describe Menu do
  it {is_expected.to respond_to(:list)}
  
  describe '#item' do
    it 'should return a menu item' do
      expect(subject.item(1)).to be_truthy
    end
  end
end