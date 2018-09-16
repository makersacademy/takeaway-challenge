require 'menu'
require 'order'

describe Order do

  let(:menu) { double :menu}
  let(:dish) { double :dish }
  # let(:menu) { object_double(Menu.new, :has_dish? => true) }

  subject { described_class.new(menu) }

  it { is_expected.to respond_to(:final_order) }
  it { is_expected.to respond_to(:add_order).with(1).argument }

  describe '#add_order' do
    it 'adds order in final order' do
      allow(menu).to receive(:has_dish?).with(dish).and_return(true)
      subject.add_order(dish)
      expect(subject.final_order).to include(dish)
    end

    it 'raise error if dish is not available' do
      allow(menu).to receive(:has_dish?).with(dish).and_return(false)
      expect { subject.add_order(dish) }.to raise_error(RuntimeError, 'Sorry, #{dish} is not availble')
    end
  end

end