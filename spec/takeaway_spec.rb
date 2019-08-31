require './lib/takeaway.rb'

describe Takeaway do
  it 'has a menu' do
    expect(subject.menu).to eq({ "burger" => "£2", "chips" => "£1", "kebab" => "3" })
  end
  it 'can create an order' do
    expect(subject.add_to_order("burger", 3)).to eq([["burger", 3]])
  end
end
