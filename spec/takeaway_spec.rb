require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'displays the list of dishes to the user' do
    expect(takeaway).to respond_to(:display_menu)
  end

  it 'adds each dish and quantity to the order total' do
    takeaway.select('Salmon roll',2)
    expect(takeaway.order).to include ({"Salmon roll"=>2})
  end

end
