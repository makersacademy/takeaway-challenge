require 'takeaway'
# am I using test doubles correctly throughout tests or am I creating vacuous tests?!

describe Takeaway do
  default_menu = Menu::MENU
  confirmation_message = "Thank you for your order, which totals to £12.00. Your food will arrive by #{(Time.now + 60*60).strftime("%H:%M")}"
  
    let(:menu) { double :menu, dishes: default_menu, display: "Curry House Menu" } 
    let(:order) { double :order, add: "2x dal, at £6.50 each, added to your order", basket_total: 12 }
    let(:text) { instance_double(Message, send: confirmation_message) }
    subject { described_class.new(menu, order) } 

  it 'can display menu' do
    expect(menu).to receive(:display)
    subject.view_menu
  end

  it 'can add dish to order' do 
    expect(order).to receive(:add).with("dal", 2)
    subject.add_to_order("dal", 2)
  end

  it 'raises error if user tries to add a dish not on the menu' do
    expect{ subject.add_to_order("pizza", 4) }.to raise_error("That dish is not on our menu, please choose a dish from our menu.")
  end

  it 'can show order' do
    expect(order).to receive(:display)
    subject.view_order
  end

  it 'informs customer if total is correct/incorrect' do
    allow(order).to receive(:check_total?).and_return(true)
    expect(subject.check_total).to eq("Your order total has been calculated correctly")
  end

  it 'sends text message via Message class when order is completed' do #do I also need a separate test to test that a new instance of Message is created via the complete_order method? if so, how to do this?
    allow(Message).to receive(:new).and_return(text)
    expect(text).to receive(:send).with("12.00")
    subject.complete_order
  end

  it 'confirms order total and arrival time to customer' do 
    allow(Message).to receive(:new).and_return(text)
    expect(subject.complete_order).to eq confirmation_message
  end

end
