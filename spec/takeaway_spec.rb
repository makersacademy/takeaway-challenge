require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new}

  it { is_expected.to respond_to :show_menu }

  it 'allows customers to make a new order' do
    expect(takeaway.new_order(:selected_dish)).to eq [:selected_dish]
  end

  
  it 'allows customers to check order' do
    expect{ takeaway.check_order}.to raise_error 'No dishes selected'
  end
end
