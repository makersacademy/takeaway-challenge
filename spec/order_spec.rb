require 'order'

describe Order do
  let(:dish) { instance_double("Dish", :name => 'Curry', :price => 2.95) }

  it 'is empty when created' do
    expect(subject.items).to eq []
  end

  it 'adds an item to the order' do
    subject.add_to_order(dish, 1)
    expect(subject.items).to include({ :dish => dish, :quantity => 1 })
  end

  it 'records the quantity ordered for each dish' do
    subject.add_to_order(dish, 3)
    expect(subject.items).to include({ :dish => dish, :quantity => 3 })
  end

  context '#total' do
    it 'reports the total cost' do
      subject.add_to_order(dish, 2)
      expect(subject.total).to eq(dish.price * 2)
    end

    it 'reports the updated total when more items are added' do
      subject.add_to_order(dish, 2)
      subject.add_to_order(dish, 3)
      expect(subject.total).to eq(dish.price * 5)
    end
  end
end
