require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print_format: print_format) }
  let(:print_format) { "pizza: 3" }
  let(:order) { double(:order) } 
  let(:food) { {pizza: 3, soup: 4} }

  # works with '#menu'
  it "shows menu with price" do
    expect(takeaway.print_menu).to eq(print_format)
  end

  # works with '#order'
  it 'order avilable food' do
    expect(order).to receive(:add).twice # pizza: 3 are two seperate objects ".once" wont work"
    takeaway.order_total(food)
  end
 end
