require 'order'

describe Order do

   before do
     @order = []
   end

  it 'should show the order' do
    expect(subject.order).to eq(@order)
  end

  describe '#place' do

    it 'should store the item and the quantity asked for' do
      expect(subject.place(:marguerita, 2)).to eq([{ :item => :marguerita, :quantity => 2 }])
    end
    
  end
end