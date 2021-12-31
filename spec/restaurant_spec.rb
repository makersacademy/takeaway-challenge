require 'restaurant'

describe Restaurant do
  default_menu = Menu::MENU
    
    let(:menu) { double :menu, dishes: default_menu, display: "Curry House Menu" } #use the let method to set the double we have created to the variable :menu. Then used the double method to set dishes method to return default_menu
    let(:order) { double :order, add: "2x dal, at £6.50 each, added to your order", basket_total: 12 }
    #let(:text) { double :text, send: "Thank you" }
    let(:text) { instance_double(Message) }
    #let(:time) {double :time }
    subject { described_class.new(menu, order) } 

  it 'can display menu' do
    expect(menu).to receive(:display)
    subject.view_menu
  end

  it 'can add dish to order' do 
    expect(order).to receive(:add).with("dal", 2)
    subject.add_to_order("dal", 2)
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
    time = Time.now + 60*60
    allow(Message).to receive(:new).and_return(text)
    allow(Time).to receive(:now).and_return(time) 
    expect(subject.complete_order).to eq "Thank you for your order, which totals to £12.00. Your food will arrive by #{time.strftime("%H:%M)")}"
  end
end
