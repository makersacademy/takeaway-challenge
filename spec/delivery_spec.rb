require 'deliverytime'
describe DeliveryTime do
  subject(:delivery) { DeliveryTime.new('number') }
  it 'texts conformation through order' do
    expect(delivery.send).to eq('sent')
  end
end
