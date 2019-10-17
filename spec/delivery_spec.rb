require 'deliverytime'
describe DeliveryTime do
  subject(:delivery) { DeliveryTime.new('number') }
  it 'texts conformation through order' do
    expect(delivery.send).to eq('sent')
  end
  it 'tests the time is corect' do
    @time = Time.new
    @new_time = (@time.hour + 1).to_s + ":" + @time.min.to_s
    expect(subject.new_time).to eq(@new_time)
  end
end
