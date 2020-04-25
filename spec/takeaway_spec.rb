require 'takeaway'

describe TakeAway do

  let(:id)  { double :id}
  let(:name) { double :name }
  let(:price) { double :price }
  let(:menu) { double :menu id: id, name: name, price: price }

  it 'creating list of dishes with price' do
    takeaway = TakeAway.new(menu)
    expect(takeaway.menu).to be menu
  end

end
