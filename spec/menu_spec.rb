require 'menu'

describe Menu do

  let(:name) {double "name"}
  let(:price) {double 2}
  
  it 'generats a menu with dish and their prices' do
      allow(subject).to receive(:dish).with(2).and_return({name => price})
  end
end
