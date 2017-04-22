require 'order_selection'

RSpec.describe OrderSelection do

  before(:each) do
    subject.menu = {'kebab': 5}
  end


  it {is_expected.to respond_to(:cart)}

  it 'cart should be empty to begin with' do
    expect(subject.cart).to eq []
  end

  describe '#add_item' do
    it 'adds food to cart' do
      subject.add_item('kebab')
      expect(subject.cart).to eq ['kebab']
    end

    it 'rasies error if the item does not exist' do
      expect {subject.add_item('kebabsgs')}.to raise_error "item does not exist"
    end
  end

  describe '#remove_item' do
    it 'removes food from cart' do
      subject.add_item('kebab')
      subject.remove_item('kebab')
      expect(subject.cart).to eq []
    end

    it 'raises error if the item does not exist' do
      expect {subject.remove_item('kebab')}.to raise_error "item does not exist"
end
end


end
