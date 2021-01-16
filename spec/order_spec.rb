require 'order'

describe Order do
  subject { described_class.new }
  let(:new_order) { "Beef Burger" }
  let(:wrong_order) { "Fish Burger" }
  let(:menu) { {
    "Beef Burger" => 7,
    "Double Cheese Burger" => 9,
    "Hamburger" => 7,
    "Fish Taco" => 6,
    "Hot Dog" => 5,
    "Chips" => 2,
  } }


  it { is_expected.to respond_to(:order) }
  it { is_expected.to respond_to(:add_to_order).with(2).argument }
  it { is_expected.to respond_to(:price_of_order) }

  context 'on initalization' do
    it 'order is empty' do
      expect(subject.order).to be_empty
    end

    it 'menu is preloaded' do
      expect(subject.menu).to eq(menu)
    end
  end

  describe '#add_to_order' do
    it 'adds menu items to order' do
      expect{ subject.add_to_order(new_order)}.to change{ subject.order}.to([new_order])
    end
  end

  context 'raises an error' do
    it "when item not on menu" do
      expect { subject.add_to_order(wrong_order)}.to raise_error "This item is not an the menu!"
    end
  end

end
