require 'customer'

describe Customer do

  it {is_expected.to respond_to(:select_dish).with(2).argument}

  it 'should not be able to add dishes not on the menu' do
    expect{subject.select_dish("cars", 3)}.to raise_error 'Dish not on menu'
  end

  it 'should be able to select dishes from menu' do
    subject.select_dish("chicken burger meal", 2)
    expect(subject.order).to eq("chicken burger meal"=>2)
  end

  it 'should be able to add quantity when a dish or dishes are added' do
    subject.select_dish("chicken burger meal", 3)
    expect(subject.total_items).to eq 3
  end

  it  'should be able to display a receipt of full order' do
    subject.select_dish("chicken burger meal", 3)
    expect(subject.receipt).to eq("3x chicken burger meal - £13.47")
  end

  it 'must display entire menu' do
    expect(subject.display_menu).to eq("4x chicken wings" => 1.59,
        "chicken burger meal" => 4.49, "fries" => 1.29, "pizza" => 4.99)
  end

  it 'should update order total when items are added' do
    subject.select_dish("chicken burger meal", 3)
    expect(subject.order_total).to eq(13.47)
  end

  it 'must give order total cost' do
    subject.select_dish("chicken burger meal", 3)
    expect(subject.order_total_cost).to eq("Total    £13.47")
  end

  it "sends a message" do
      messages = double :messages, create: nil
      account = double :account, messages: messages
      client = double :client, account: account
      allow(Twilio::REST::Client).to receive(:new) { client }
      expect(messages).to receive(:create).with(body:
        "Thank you! Your order was placed and will be delivered within the next hour.",
            to: "+447415121250",
              from: "+442820032756")
      subject.send_message("+447415121250")
  end
end
