require 'menu'
require 'order'

describe Order do

  let(:menu) { double :menu}
  let(:dish) { double :dish }
  # let(:menu) { object_double(Menu.new, :has_dish? => true) }

  subject { described_class.new(menu) }

  it { is_expected.to respond_to(:final_order) }
  it { is_expected.to respond_to(:add_order).with(2).argument }

  describe '#add_order' do

    it 'adds order in final order' do
      dish_name = double 'dish_name' 
      allow(menu).to receive(:get_dish_obj).with(dish_name).and_return(dish)
      allow(menu).to receive(:has_dish?).with(dish_name).and_return(true)
      subject.add_order(dish_name, 2)
      expect(subject.final_order).to include({Ordered_dish: dish, Quantity: 2})
    end

    it 'raise error if dish is not available' do
      allow(menu).to receive(:has_dish?).with(dish).and_return(false)
      expect { subject.add_order(dish, 2) }.to raise_error(RuntimeError, 'Sorry, #{dish} is not availble')
    end
  end

end