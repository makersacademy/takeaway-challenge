require 'basket'
require 'dish'

describe Basket do
  let(:dish2) { instance_double(Dish, :name => "chips", :price => 2.50) }
  let(:dish1) { instance_double(Dish, :name => "burger", :price => 4.00) }
  let(:dish3) { instance_double(Dish, :name => "pepsi", :price => 1.00) }

  describe '#add_to_basket' do
    it 'can add dish items to @in_basket' do
      expect { subject.add_to_basket(dish1) }.to change { subject.in_basket.length }.by(1)
    end
  end

  describe '#remove_from_basket' do
    it 'can add remove items from @in_basket' do
      subject.add_to_basket(dish1)
      expect { subject.remove_from_basket(dish1) }.to change { subject.in_basket.length }.by(-1)
    end
  end
end