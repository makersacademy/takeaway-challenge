require 'order'

describe Order do
  # let(:menu) do
  #   double :menu, takeaway_menu: { 'California roll': 4.0, 'Spicy tuna roll': 4.5 }
  # end

  # subject { Order.new(menu) }

  it 'has a menu when initialised' do
    expect(subject.menu).not_to be_empty
  end

  it { is_expected.to respond_to :display_menu }

  it { is_expected.to respond_to(:add_dish).with(2).arguments }

  it 'has an empty order_content array when created' do
    expect(subject.order_content).to be_empty
  end

  describe '#add_dish' do

    it 'add a dish to the order' do
      subject.add_dish('California roll', 1)
      expect(subject.order_content).to eq (['California roll'])
    end

    it 'raises error if dish is not on the menu' do
      expect{ subject.add_dish('banana', 1) }.to raise_error 'Dish not on menu!'
    end

  end

  describe '#add_dish' do

    it 'updates order total when adding single pizza' do
      subject.add('California roll', 1)
      expect(subject.total_cost).to eq 4.0
    end

    it 'updates order total when adding more than one of a pizza' do
      subject.add('California roll', 2)
      expect(subject.total_cost).to eq 8.0
    end

  end


end

# setup
# action
# expectation


# setup
# expectation about future
# action
