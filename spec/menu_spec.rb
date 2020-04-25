require 'menu'
require 'dish'

context Menu do

  it { is_expected.to respond_to(:add).with(1).argument }

  describe '#add' do
    dish = Dish.new(1, 2.00, "Plain rice")
    it 'returns dish added on success' do
      expect(subject.add(dish)).to eq dish
    end
  end
  
end
