require 'order'

RSpec.describe Order do

  time_of_order = Time.new(2016, 12, 25, 18, 00)

  it 'sends a notification of an order' do
    # expect(subject).to respond_to(:notification)
    expect(subject.notification(time_of_order)).to eq(Order::MESSAGE + "06:10PM")

  end

  let(:selection) { [{ dish: "DAIFUKU", qty: 1 }, { dish: "ICHIGO", qty: 2 }] }

  it 'select dishes with their quantity' do
    subject.select("DAIFUKU", 1)

    expect(subject.select("ICHIGO", 2)).to eq(selection)
  end

end
