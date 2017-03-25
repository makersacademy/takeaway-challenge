require 'order'

describe Order do
  let(:item) {double(:item)}
  let(:dish) {{"Hamburger" => 5.00}}

  describe '#items' do
    it 'contains items initially' do
      expect(subject.dishes).not_to be_empty
    end
  end

  describe '#menu' do
    it {is_expected.to respond_to(:menu)}
  end

  describe '#add' do
    it 'adds an item to the order' do
      subject.add("Hamburger")
      expect(subject.total_order).to include(dish)
    end

    it 'can add multiple items' do
      expected_hash = [{"Hamburger"=>5.0}, {"Hamburger"=>5.0}, {"Hamburger"=>5.0}]
      expect(subject.add("Hamburger", 3)).to eq(expected_hash)
    end
  end

  describe '#view_dishes' do
    it 'should list all available items and prices' do
      expect(subject.view_dishes).to eq subject.dishes
    end
  end

  describe '#total_order_cost' do
    it 'returns the total cost of the order' do
      cost = dish["Hamburger"] * 3
      subject.add("Hamburger", 3)
      expect(subject.total_order_cost).to eq(cost)
    end
  end

  describe '#place_order' do
    it 'checks whether expected total is equal to actual total' do
      subject.add("Hamburger", 3)
      expect{subject.place_order(3)}.to raise_error "Order total is 15.0. You expected 3."
    end
  end

end
