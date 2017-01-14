require 'dish'

describe Dish do
  subject(:dish) {described_class.new("Steamed Rice", 3.50)}

  describe '#new_class_instance' do
    it 'initializes with a name' do
      expect(dish.name).to eq "Steamed Rice"
    end

    it 'initializes with a price' do
      expect(dish.price).to eq 3.50
    end
  end

end
