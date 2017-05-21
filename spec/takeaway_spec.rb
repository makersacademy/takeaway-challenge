require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new}

  it { is_expected.to respond_to :show_menu }

  it 'allows customers to make a new order' do
    expect(takeaway.new_order(:selected_dish)).to eq [:selected_dish]
  end
end
