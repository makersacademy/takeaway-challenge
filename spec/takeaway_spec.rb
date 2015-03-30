require 'rspec'
require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:order) { double :order }
  let(:menu) { double :menu }
  let(:dl) { double :dish_list }

  before(:example) { allow(takeaway).to receive(:order).and_return(order) }
  before(:example) { allow(takeaway).to receive(:menu).and_return(menu) }
  before(:example) { allow(takeaway).to receive(:dish_list).and_return(dl) }
  before(:example) { allow(order).to receive(:total).and_return(1200) }
  before(:example) { allow(dl).to receive(:lookup) }

  it 'can add dishes to an order' do
    expect(order).to receive(:add_item).exactly(2).times
    takeaway.add_item('A2')
    takeaway.add_item('B4', 3)
  end

  it 'can show the menu to the customer' do
    expect(menu).to receive(:show_menu)
    takeaway.view_menu
  end

  it 'can show the current order to the customer' do
    allow(order).to receive(:items).and_return([])
    expect { takeaway.view_order }.to output.to_stdout
  end

  it 'can send a text to the customer once the order is placed' do
    mock_api = double :api
    allow(takeaway).to receive(:message_sender).and_return mock_api
    expect(mock_api).to receive(:send_message)
    takeaway.confirm_order
  end

end