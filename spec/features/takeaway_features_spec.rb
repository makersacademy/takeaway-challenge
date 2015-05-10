require 'order'

feature 'Takeaway ordering system' do


  scenario 'Add multiple items to an order' do
    myorder = Order.new
    myorder.add(1,2)
    expect(myorder.order[0][3]).to eq 19.0
  end

  scenario 'calculate total for multiple items' do
    myorder = Order.new
    myorder.add(1,2)
    myorder.add(1,2)
    expect(myorder.total).to eq 38.0
  end

  xscenario 'send SMS when order is complete' do
    service = double :twilio
    allow(service).to receive(:new)
    myorder = Order.new
    myorder.add(1,2)
    expect(myorder.notify(service)).to receive(:new)

  end

end
