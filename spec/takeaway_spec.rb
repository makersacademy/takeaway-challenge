require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:order) { double :order }
  let(:text_message) { double :text_message }
  let(:order_calculations) { double :order_calculations }
  let(:order_class) { double :order_class, new: order }
  subject(:takeaway) { Takeaway.new(menu, order_class, order_calculations) }

  it 'should initialize with @current_order set to nil' do
    expect(takeaway.current_order).to eq nil
  end
  it 'should return printed menu when view_menu method is called' do
    allow(menu).to receive(:print_menu) { "Test text" }
    expect(takeaway.view_menu).to eq "Test text"
  end
  it 'should send confirmation text when place_order method is called succesfully' do
    allow(order_calculations).to receive(:check_total) { true }
    allow(text_message).to receive(:send_text) { 'text sent' }
    expect(takeaway.place_order(15, text_message)).to eq 'text sent'
  end
  it 'should raise error when place_order method is called with incorrect total' do
    allow(order_calculations).to receive(:check_total) { false }
    expect { takeaway.place_order(15, text_message) }.to raise_error('Total cost given is incorrect, please recalculate and try again')
  end
  it 'should set @current_order equal to a new order object when new_order is called' do
    expect(takeaway.new_order).to eq order
  end
  it 'should call add method on @current_order order object when add_to_order is called' do
    takeaway.new_order
    expect(order).to receive(:add)
    takeaway.add_to_order("Pasta", 3)
  end
end
