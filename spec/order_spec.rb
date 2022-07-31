require 'order'

describe Order do
  
  # let(:message) {:order.confirm}
  
  describe '#add' do
    it { is_expected.to respond_to(:add) }

    it 'increases the order_list by 1' do
      expect { subject.add("Kim Chi") }.to change { subject.order_list.count }.by(1) 
    end 
    # build a test which increases the 
    # order_list by 1 after add
  end 

  describe '#sum' do 
    it 'adds the total in order_list' do 
      subject.add("Sushi")
      subject.add("Kim Chi")
      expect(subject.total).to eq(9)
    end 
  end 

  
  
#   describe "#confirm" do
#   let(:to) {+447247147113}
#   let(:from) {+44724711343}
#   let(:body) {"Order received at #{Time.now}"}

#     it 'sends a text' do
#       # client = double()
#       # message_ready = double()
#       # allow(client).to receive(:messages).and_return(message_ready)
#       # allow(message_ready).to receive(:create).and_return([to, body])
#       # expect(subject.confirm).to eq [to, body]
#       o = Order.new
# )
#       expect(o.confirm).to eq(:message)
#     end 
#   end 
end
