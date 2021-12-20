require 'takeaway'

describe Takeaway do
  let(:test) { Takeaway.new }
  
  it '#show_menu shows list of items and their cost' do
    expect(test.show_menu).to eq [{ item: 'item1', cost: 1.0 },
      { item: 'item2', cost: 2.0 },
      { item: 'item3', cost: 3.0 }]
  end
end