require 'menu'
require 'order'
require 'restaurant'

describe Restaurant do
  describe '#initialize' do
    it 'should initialize with a new instance of the Menu class' do
      expect(subject.menu).not_to be nil
    end

    it 'should initialize with a new instance of the Order class' do
      expect(subject.order).not_to be nil
    end
  end

  describe '#checkout' do
    it 'should move contents of @basket to @current_order' do
      subject.menu.add_to_basket(1,1)
      subject.checkout
      expect(subject.order.current_order).to eq [{:kebab => 5}]
    end

    it 'should raise an error if basket empty' do
      expect{subject.checkout}.to raise_error("empty basket")
    end
  end
end
