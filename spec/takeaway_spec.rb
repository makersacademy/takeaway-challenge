require 'takeaway'

describe Takeaway do

  subject(:takeaway) { Takeaway.new }
  let(:printed_menu) { "pizza is 8.0, rice is 7.0" }

  it 'has a list of dishes with their prices' do
    expect(takeaway.menu?).to eq true
  end
  it { is_expected.to respond_to(:print_menu) }

  it 'prints a menu' do
    expect(takeaway.print_menu).to eq printed_menu
  end

  it { is_expected.to respond_to(:place_order) }
  it { is_expected.to respond_to(:calculate_total) }
  it { is_expected.to respond_to(:verify_order) }

end
