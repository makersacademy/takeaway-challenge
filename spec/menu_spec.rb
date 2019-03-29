require 'menu'

describe Menu do
  let(:dish) { { dish: 'fish', price: 5, quantity: 0 } }
  let(:dish2) { { dish: 'fish', price: 5, quantity: 2 } }

  it 'has a menu' do
    expect(subject.menu).to include dish
  end

  it 'has a blank order' do
    expect(subject.order).to eq []
  end

  describe '#list_dishes' do
    it 'lists dishes' do
      expect(subject.list_dishes).to eq subject.menu
    end
  end

  describe '#order_dishes' do
    it 'can order a dish' do
      subject.order_dishes(dish2, 2)
      expect(subject.order).to eq [dish2]
    end
  end
end
