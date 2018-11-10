require 'dish'

describe Dish do
  let(:dish1) { Dish.new("Chicken Wings", 1.49) }

  describe 'initialize' do
    it 'creates a new dish' do
      expect(dish1.name).to eq "Chicken Wings"
      expect(dish1.price).to eq 1.49
    end
  end

  describe '#dish_to_h' do
    it 'formats a dish as a hash' do
      expect { puts dish1.dish_to_h }.to \
      output("{:name=>\"Chicken Wings\", :price=>1.49}\n")\
      .to_stdout
    end
  end
end
