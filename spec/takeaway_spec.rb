require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'displays the list of dishes to the user' do
    expect(takeaway).to respond_to(:display_menu)
  end

  it 'adds each dish and quantity to the order total' do
    takeaway.select('Salmon roll',2)
    expect(takeaway.order).to include ({"Salmon roll"=>2})
  end

  it 'initializes with a total = 0' do
    expect(takeaway.total).to eq 0
  end

  it 'adds price of selected dishes to total' do
    expect{ takeaway.select("Crab roll",3) }.to change{ takeaway.total }.by 21
  end

  context 'after user places order' do
    it 'calls #send_message on the MessageSender class' do
      msg_sender_double = double :MessageSender
      new_takeaway = Takeaway.new(msg_sender_double)
      expect(msg_sender_double).to receive(:send_message).with(instance_of(String),instance_of(String))
      new_takeaway.place_order
    end
  end

end
