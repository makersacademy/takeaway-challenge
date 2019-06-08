require 'takeaway'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Air baked fries 6.75£"}

  it 'shows the menu' do
    expect(subject.show_menu).to eq(printed_menu)
  end
end
