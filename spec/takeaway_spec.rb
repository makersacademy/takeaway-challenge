require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :view_menu }

  it 'should show the full menu by default' do
    expect(takeaway.view_menu).to include(:pizza_dishes)
  end

  it 'should allow the user to create an order' do
    expect(takeaway.create_new_order(:menu_item)).to eq [:menu_item]
  end

  it "returns an error if current order is empty" do
    expect{ takeaway.view_current_order }.to raise_error 'No items currently ordered'
  end

end
