require 'takeaway'

RSpec.describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "chicken: £15.00, steak: £18.00, donner: £8.00" }

  it 'shows a list of dishes with prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
  # describe '#print_menu' do
  #   it 'shows a list of the menu' do
  #     expect(subject.print_menu).to eq Takeaway::DISHES
  #   end
  # end
