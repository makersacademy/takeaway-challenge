require 'customer'

describe Customer do

  subject(:customer) {described_class.new(Order)}
  let(:current_order) { double(:order) }
  let(:send_message) { double(:send_message) }

  it 'should include a variable on initialization called Order' do
    expect(customer.order).to eq Order
  end

  it 'should be able to create a new instance of order' do
    customer.new_order
    expect(customer.current_order).to be_instance_of(Order)
  end

  it 'should let customer look at menu' do
    expect(customer.new_order).to eq Menu::MENU
  end

  it 'should send text when order is finished' do
    allow(current_order).to receive(:add_cost_to_order).and_return([{{"3. Steak and Onion API"=>7}=>1, {"2. Deep PRYed Prawns"=>6}=>2}, {"Total"=>13}])
    allow(send_message).to receive(:send).and_return("text sent")
    customer.new_order
    customer.place_order(3,2,2)
    customer.current_order.add_cost_to_order
    expect(customer.finish_order(send_message)).to eq("text sent")
  end

  it 'should show the current order' do
    allow(current_order).to receive(:add_cost_to_order).and_return([{{"3. Steak and Onion API"=>7}=>1, {"2. Deep PRYed Prawns"=>6}=>2}, {"Total"=>13}])
    customer.new_order
    customer.place_order(3,2,2)
    customer.current_order.add_cost_to_order
    expect(customer.current_order.order).to eq([{{"3. Steak and Onion API"=>7}=>1, {"2. Deep PRYed Prawns"=>6}=>2}, {"Total"=>19}])
  end

end
