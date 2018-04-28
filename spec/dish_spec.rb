describe Dish do

  let(:set_dish) { Dish.new(item: "Margherita", description: "Oregano, mozzarella and tomato", price: 7.50) }

  describe '#initilize' do

    it 'defaults to an empty name' do
      expect(subject.name).to be_nil
    end

    it 'defaults to a empty description' do
      expect(subject.description).to be_nil
    end

    it 'defaults to a empty price' do
      expect(subject.price).to be_nil
    end

    it 'sets the name' do
      expect(set_dish.name).to eq "Margherita"
    end

    it 'sets the description' do
      expect(set_dish.description).to eq "Oregano, mozzarella and tomato"
    end

    it 'sets the price' do
      expect(set_dish.price).to eq 7.50
    end

  end

end
