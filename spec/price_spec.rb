require 'price'

describe Price do
  describe '#food_conversion' do
    it 'calculates the true total of the order' do
      subject.food_conversion(["Mozzarella Sticks", "Pepperoni Pizza"])
      expect(subject.true_total).to eq 20.48
    end
  end
end
