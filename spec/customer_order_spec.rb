require 'customer_order'
require 'envyable'
Envyable.load('./config/env.yml', 'development')
require 'twilio-ruby'
require 'date'
require 'webmock'
include WebMock::API

WebMock.enable!

describe CustomerOrder do

  let(:customer_order) { described_class.new }
  let(:dish_1) { double :dish, name: 'Fruit Basket', price: 10.99 }
  let(:dish_2) { double :dish, name: 'Eggs Bennedict', price: 11.99 }

  it 'can have orders added to it' do
    expect(customer_order.add(dish_1)).to eq [dish_1]
  end

  it 'can have orders removed from it' do
    customer_order.add(dish_1)
    expect { customer_order.remove(dish_1) }.to change { customer_order.order_count }.from(1).to(0)
  end

  it 'cannot remove dishes that it does not contain' do
    message = "That dish is not in this order"
    expect { customer_order.remove(dish_1) }.to raise_error message
  end

  it 'displays its contents' do
    customer_order.add(dish_1)
    customer_order.add(dish_2)
    expect(customer_order.show_contents).to eq [dish_1, dish_2]
  end

  # it "can send text" do
  #   stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/AC81484a848edc0fb0b146b2a41ed43093/Messages.json").
  #   with(body: { "Body" => "Hello , your order has been dispatched from Makers Bistro.\n It will arrive in 45 minutes at 16.22!", "From"=>"+441740582048", "To"=>nil},
  #   # headers: {'Accept' => 'application/json', 'Accept-Charset' => 'utf-8', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization' => 'Basic QUM4MTQ4NGE4NDhlZGMwZmIwYjE0NmIyYTQxZWQ0MzA5Mzo1MWJkN2NhMTJhMjEyYTU2NTgyNDJjMjY4MjIzNzU2ZA==', 'Content-Type' => 'application/x-www-form-urlencoded', 'User-Agent' => 'twilio-ruby/4.13.0 (ruby/x86_64-darwin16 2.4.0-p0)'}).
  #   # to_return(status: 200, body: "", headers: {})
  #   customer_order.complete_and_send_text('sdgsfg', '07788238989', 'sdfgsfgsffdg')
  #   expect(customer_order).to receive(:complete_and_send_text)
  # end

end
