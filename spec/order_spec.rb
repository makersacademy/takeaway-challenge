require 'order'

describe Order do

  let(:order1) { [['icecream', 4]] }

  it 'returns the menu' do
    expect(subject.menu).to eq subject.menu_list
  end

  it 'has an order log' do
    expect(subject.order_log).to be_empty
  end

  describe 'ordering food' do
    before(:each) do
      subject.add_order('icecream', 4)
    end
    it 'allows an item, and quantity to be input' do
      expect(subject.order_log).to eq order1
    end

    it 'records a sum of food input' do
      subject.add_order('dohnuts', 7)
      expect(subject.sum).to eq [20, 14]
    end
  end
end
