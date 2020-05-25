require 'order'

describe Order do
   
  it 'should show the order' do
    expect(subject.order).to eq([])
  end
  describe '#place' do
    it 'should store x number of asked item ' do
      expect(subject.place(:marguerita, 2)).to eq([{ :item => :marguerita, :quantity => 2 }])
    end
  end
end