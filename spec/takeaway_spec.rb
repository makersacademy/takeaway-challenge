require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu}

  it 'should initialize with a menu' do
    expect(takeaway.menu).to eq menu
  end

  # describe '#print_list' do
  #   it 'should respond to the print list method' do
  #     expect(menu).to respond_to(:print_list)
  #   end
  #
  #   it 'should print the list of dishes and prices' do
  #     expect(menu.print_list).to eq price_list
  #   end
  # end

end
