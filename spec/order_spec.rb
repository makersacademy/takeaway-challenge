require 'order'
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
# context 'select items' do

describe Order do
  context 'place order method is functional' do
  let(:order){ described_class.new({ 'A' => 1550, "B" => 1050 })}
  it 'takes method place order' do
    expect(order).to respond_to(:placeorder)
  end
end

context 'test time method produces time formatted to string length 5' do
  let(:order){ described_class.new({ 'A' => 1550, "B" => 1050 })}
  it 'converts time to readable 4 character format' do
    order.time = Time.now
    expect(order.delivery_time_reformat.length).to eq(5)
  end
 end
end



#  allow(takeout).to receieve(:order).and_return
