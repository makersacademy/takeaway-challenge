require 'order_selection'

RSpec.describe OrderSelection do


  it {is_expected.to respond_to(:cart)}

  it 'cart should be empty to begin with' do
    expect(subject.cart).to eq []
  end

  describe '#add_item' do
    it 'adds a food from menu to cart' do
    subject.menu = {'kebab': 5}
    subject.add_item('kebab')
    expect(subject.cart).to eq ['kebab']
  end

   it 'rasies error if the item does not exist' do
     subject.menu = {'kebab': 5}
     expect {subject.add_item('kebabsgs')}.to raise_error "item does not exist"
end
end

end
