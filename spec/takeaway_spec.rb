require 'takeaway'

RSpec.describe Takeaway do
  let(:mock_message) { double(Message.new) }
  let(:mock_message_class) { double(Message) }
  let(:mock_order) { double(Order.new) }
  let(:mock_order_class) { double(Order) }
  let(:subject) { described_class.new(mock_message_class, mock_order_class) }

  describe '#show_menu' do

    it 'return a list of dishes' do
      expect(subject.menu).to eq Takeaway::LIST
    end
  end

  describe '#select' do

    it 'returns a list of selected dishes and their number' do
      allow(mock_order_class).to receive(:new).and_return(mock_order)
      allow(mock_order).to receive(:start_order) { { :olives => 1 } }
      expect(subject.select).to eq({ :olives => 1 }) 
    end 
  end 

  describe '#check_total' do
    before(:each) {
      $stdin = StringIO.new
      allow(mock_order_class).to receive(:new).and_return(mock_order)
      allow(mock_order).to receive(:start_order) { { :olives => 1 } }
      allow(mock_order).to receive(:total) { 4 }
      subject.select
    }
      # stub the variable or create a method
    it 'send a message if user input match the total' do
      allow($stdin).to receive(:gets).and_return("4")
      expect(subject.check_total).to eq("The total match the sum of 4£")
    end

    it 'raise an error if the user input the wrong total' do
      allow($stdin).to receive(:gets).and_return("10")
      expect { subject.check_total }.to raise_error 'The total is not correct'
    end
  end

  describe '#place_order' do

    it 'send a message to place the order' do
      allow(mock_message_class).to receive(:new) { mock_message }
      allow(mock_message).to receive(:send) { "message" }
      expect(subject.place_order).to eq("message")
    end
  end

end
