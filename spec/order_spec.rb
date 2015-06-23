require 'order'

describe Order do
  let(:menu) do
    double :menu, takeaway_menu: { 'California roll': 4.0, 'Spicy tuna roll': 4.5 }
  end

  subject { Order.new(Menu.new) }

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
      expect { subject.add_dish('banana', 1) }.to raise_error 'Dish not on menu!'
    end

  end

  describe '#remove_dish' do

    it 'removes a dish from the order content' do
      subject.add_dish('California roll', 1 )
      subject.add_dish('Spicy tuna roll', 1 )
      subject.remove_dish('California roll', 1)
      expect(subject.order_content).to eq ['Spicy tuna roll']
    end

  end

  describe '#bill_total' do

    it 'updates order total when adding single dish' do
      subject.add_dish('California roll', 1)
      expect(subject.bill_total).to eq 4.0
    end

    it 'updates order total when adding more than a single dish' do
      subject.add_dish('California roll', 2)
      expect(subject.bill_total).to eq 8.0
    end

  end

  describe '#print_itemised_bill' do

    it { is_expected.to respond_to :print_itemised_bill }

    xit 'prints an itemised bill' do
      subject.add_dish('California roll', 2)
      subject.remove_dish('California roll', 1)
      expect(subject.print_itemised_bill).to eq 'California roll £4.0 California roll £4.0 Spicy tuna roll £4.5 Bill total: £12.5'
    end

  end

end
