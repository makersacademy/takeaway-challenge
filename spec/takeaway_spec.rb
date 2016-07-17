require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { {"Beef" => 5.00, "Chicken" => 4.50, "Veg" => 3.50} }

  it '#display_menu' do
    expect(takeaway.display_menu).to include menu
  end

end
