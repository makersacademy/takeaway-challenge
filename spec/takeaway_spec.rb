require 'Takeaway'

describe Takeaway do

  subject(:takeaway1) {described_class.new}
  order_hash = {"Chicken Noodle Soup" => 1,
           "Burger and Fries" => 1,
           "Chicken Tikka Madras" => 1,
           "Fresh Caesar Salad" => 1}

  wrong_order = {"Chicken Noodle Soup" => 1,"Chicken Tikka Madras" => 1, 'Beans On Toast' => 1}

  it 'creates a new Takeaway' do
    expect(described_class.new).to be_a(Takeaway)
  end

  it 'has an order method' do
    expect(subject).to respond_to(:make_order).with(2).arguments
  end

  it 'takes an order in form of a hash' do
    subject.make_order(order_hash,nil)
    expect(subject.customer_order).to be_a (Hash)
    end

  it 'checks customer has ordered only existing dishes' do
    message = "sorry you have ordered something that doesn't exist"
    message2 = " on the menu, please check your order and try again"
    expect{subject.make_order(wrong_order,nil)}.to raise_error(message+message2)
  end
end
