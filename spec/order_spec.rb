require 'order.rb'

describe Order do 
  subject(:order) { described_class.new(takeaway_restaurant) }
  let(:takeaway_restaurant) { double :takeaway_restaurant }
  let(:item_1) { double :item_1 }
  let(:item_2) { double :item_2 }
  let(:item_3) { double :item_3 }

  it 'initializes with one argument' do
    expect { Order.new(takeaway_restaurant) }.not_to raise_error
  end

  it 'adds an item to its current order status' do
    order.add_item(item_1, 3)
    expect(order.current_items[0][0]).to eq item_1
  end
  
  it 'adds multiple items to its current order status' do
    order.add_item(item_1, 5)
    order.add_item(item_2, 3)
    order.add_item(item_3, 8)
    expect(order.current_items[1][0]).to eq item_2
  end

  context 'when submitting order' do 

    before do 
      stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/ACdffb9edd5111340d41549cb5fdf96bc0/Messages.json").
        with(
          body: {"Body"=>"Your order total is confirmed, total cost is 47.5 and will be delivered by 11am", "From"=>"+441133205765", "To"=>"+447412525804"},
          headers: {
          'Accept'=>'application/json',
          'Accept-Charset'=>'utf-8',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Basic QUNkZmZiOWVkZDUxMTEzNDBkNDE1NDljYjVmZGY5NmJjMDpmZDE1ZWU5OWNkMTRhNmQ2YTg5NmY2M2I0NDFmZjdjMQ==',
          'Content-Type'=>'application/x-www-form-urlencoded',
          'User-Agent'=>'twilio-ruby/5.10.2 (ruby/x86_64-darwin17 2.5.0-p0)'
          }).
        to_return(status: 200, body: "", headers: {})
    end

    it 'submitting the order returns the total cost' do
      this_order = Order.new(Restaurant.new)
      this_order.add_item(:chicken_curry, 5)
      expect(this_order.submit(47.5)).to eq(9.50 * 5)
    end 

    it 'raises an error if the suspected total doesnt match actual total' do
      this_order = Order.new(Restaurant.new)
      this_order.add_item(:chicken_curry, 5)
      expect { this_order.submit(10) }.to raise_error "The suspected total is wrong"
    end

    it 'creates a time for the delivery to be sent' do
      expect(subject.delivery_time).to be_instance_of(String) 
    end
  end 

end


