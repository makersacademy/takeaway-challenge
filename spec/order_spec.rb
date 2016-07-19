require 'order'

describe Order do
  it{is_expected.to respond_to(:customer_order)}
  it{is_expected.to respond_to(:get_order)}
  subject {Order.new}

  describe '#get_order' do

   #before{@input = 'PhadThai'}
   #let(:dish){StringIO.new @input}
      #allow($stdin).to receive(:gets).and_return("PhadThai")
      #allow(STDIN).to receive(:read).and_return("PhadThai", "1", "/n")
      #allow($stdout).to receive(:write)
#
      #require 'stringio'
      #input = StringIO.new
      #order = Order.new
      #order.get_order
      #input.seek(1)
      #assert_equal "PhadThai\n", input.read
    #end



  it 'captures what the customer ordered' do
    subject.get_order
    expect(subject.customer_order).to eq ['PhadThai']
  end
  end
end
