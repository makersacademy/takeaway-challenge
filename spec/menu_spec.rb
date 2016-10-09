require 'menu'


describe Menu do

let(:pasta) {double(:item, name: "Pasta", price: 5)}
let(:pizza) { double(:item, name: "Pizza", price: 7) }

  it 'can return list of items and prices' do
    expect(subject.check).to eq subject.items
  end

end
