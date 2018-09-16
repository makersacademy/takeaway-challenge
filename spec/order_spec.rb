require 'menu'
require 'order'

describe Order do

  let(:menu) { double :menu}
  let(:dish) { double :dish }
  # let(:menu) { object_double(Menu.new, :has_dish? => true) }

  subject { described_class.new(menu) }

  it { is_expected.to respond_to(:final_order) }
  it { is_expected.to respond_to(:add_order).with(2).argument }
  it { is_expected.to respond_to(:final_bill) }

  describe '#add_order' do

    it 'adds order in final order' do
      dish_name = double 'dish_name' 
      allow(menu).to receive(:get_dish_obj).with(dish_name).and_return(dish)
      allow(menu).to receive(:has_dish?).with(dish_name).and_return(true)
      subject.add_order(dish_name, 2)
      expect(subject.final_order).to include({dish: dish, quantity: 2})
    end

    it 'raise error if dish is not available' do
      allow(menu).to receive(:has_dish?).with(dish).and_return(false)
      expect { subject.add_order(dish, 2) }.to raise_error(RuntimeError, 'Sorry, #{dish} is not availble')
    end
  end

  describe '#final_bill' do
    it 'sums the total price of ordered dishes' do
      dish_1 = object_double(Dish.new, :name => "dish_name", :price => 10)
      dish_2 = object_double(Dish.new, :name => "dish_name2", :price => 20)
      allow(menu).to receive(:has_dish?).with("dish_name").and_return(true)
      allow(menu).to receive(:has_dish?).with("dish_name2").and_return(true)
      allow(menu).to receive(:get_dish_obj).with("dish_name").and_return(dish_1)
      allow(menu).to receive(:get_dish_obj).with("dish_name2").and_return(dish_2)

      subject.add_order("dish_name", 1)
      subject.add_order("dish_name2", 3)
      expect(subject.final_bill).to eq(70)
    end 
  end

end