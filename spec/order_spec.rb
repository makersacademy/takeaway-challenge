require 'order'

describe Order do
  it{is_expected.to respond_to(:customer_order)}
  it{is_expected.to respond_to(:get_order)}
  #subject {Order.new}

  #escribe '#get_order' do

  #  before do
  #    allow(subject).to receive(:gets).and_return("PhadThai")
  #  end

  #  context 'when a customer places an order' do
  #    it 'asks what the customer would like' do
  #      expect{subject.get_order}.to output("What would you like to order?\nTo finish, just press enter twice\n").to_stdout
  #    end

      #it 'captures what the customer ordered' do
        #subject.get_order
        #expect(subject.customer_order).to eq ['PhadThai']
  #    #end
  #  end
  #end
end
