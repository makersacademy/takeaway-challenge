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
      subject.add_item('kebab',2)
      expect(subject.cart).to eq ['kebab','kebab']
    end

    it 'rasies error if the item does not exist' do
      expect {subject.add_item('kebabsgs',1)}.to raise_error "item does not exist"
    end
  end

  describe '#remove_item' do

    it 'removes food from cart' do
      subject.add_item('kebab',2)
      subject.remove_item('kebab',2)
      expect(subject.cart).to eq []
    end

    it 'raises error if number of item does not exist' do
      subject.add_item('kebab',1)
      expect {subject.remove_item('kebab',2)}.to raise_error "Amount not available for removal"
    end
  end

  describe '#view_cart' do
    it 'should print out the cart' do
      subject.add_item('kebab', 2)
      expect(subject.view_cart).to eq '2 kebab'
    end
  end

end
