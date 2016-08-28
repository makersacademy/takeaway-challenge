require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:order) { double :order, :add => 0 }
  let(:text) {double :text}

  it 'displays the menu' do
    expect(takeaway.read_menu).to include({ "chips" => 1.00 })
  end

  it 'passes items to the order basket' do
    takeaway.add("chips", 2)
    message = "Your basket contains: {\"chips\"=>2}"
    expect(takeaway.view_order).to eq(message)
  end

  it 'returns the correct total' do
    takeaway.add("coke", 2)
    takeaway.add("chips", 1)
    expect(takeaway.check_total).to eq("The correct total is £2.40.")
  end

  # context 'confirming the order' do
  #   before do
  #     allow(takeaway).to receive(:send_text)
  #   end
  #
  #   it 'sends an SMS confirmation' do
  #     takeaway.add("coke", 2)
  #     takeaway.add("chips", 1)
  #     expect(takeaway).to receive(:send_text)
  #     takeaway.confirm_order(2.40)
  #   end
  # end


end
