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

  describe '#view_items' do
    it 'should list all available items and prices' do
      expect(subject.view_dishes).to eq subject.dishes
    end
  end
end
