require 'Takeaway'

describe Takeaway do

  subject(:takeaway1) {described_class.new}
  order_hash = {"chicken noodle soup" => 2,
           "burger and fries" => 1,
           "chicken tikka madras" => 4,
           "fresh caesar salad" => 1}

  wrong_order = {"chicken noodle soup" => 1,"chicken tikka madras" => 1, 'beans on toast' => 1}

  it 'creates a new Takeaway' do
    expect(described_class.new).to be_a(Takeaway)
  end

  it 'has an order method' do
    expect(subject).to respond_to(:place_order).with(2).arguments
  end

  it 'takes an order in form of a hash' do
    subject.place_order(order_hash,46.5)
    expect(subject.customer_order).to be_a (Hash)
    end

  it 'checks customer has ordered only existing dishes' do
    message = "sorry you have ordered something that doesn't exist"
    message2 = " on the menu, please check your order and try again"
    expect{subject.place_order(wrong_order,nil)}.to raise_error(message+message2)
  end

  it 'calculates the sum of the order' do
      order_value = 46.5
      subject.place_order(order_hash, order_value)
      expect(subject.order_sum).to eq order_value
      end

  it 'raises an error if the customers sum is not correct' do
    order_value = 45.5
    message = 'sorry your calculated sum does not match the order total'
    expect{subject.place_order(order_hash, order_value)}.to raise_error(message)
  end
end
