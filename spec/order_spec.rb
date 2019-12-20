require 'order'

describe Order do

  it 'initializes 0 total' do
    expect(subject.total).to eq(0)
  end

  it 'initializes an empty order list' do
    expect(subject.order_list).to be_empty
  end

  it { is_expected.to respond_to(:select).with(2).argument }

  describe ".select" do

    let(:dish){ double :dish}

    it 'saves the dishes' do
      subject.select(dish,1)
     expect(subject.order_list).not_to be_empty
   end
 end

end
