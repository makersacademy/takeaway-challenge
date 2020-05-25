require 'order'
require 'menu'

describe Order do

  before do
    @order = []
  end

  it 'should show the order' do
    expect(subject.order).to eq(subject.instance_variable_get(:@order))
  end

  describe '#place' do
    it 'should store the item and the quantity asked for' do
      expect(subject.place(:marguerita, 2)).to eq([{ :item => :marguerita, :quantity => 2 }])
    end

    it 'should raise an error if the item asked is not on the menu MY_MENU' do
      expect { subject.place(:napoletana, 1) }.to raise_error("Sorry we don't have this item at the moment!")
    end
  end
end
