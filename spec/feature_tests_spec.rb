# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'menuprinter'
require 'takeaway'
require 'basketprinter'

describe "Takeaway feature" do
  let(:takeaway_with_items) {takeaway = Takeaway.new ; takeaway.add_item(chips) ; takeaway.add_item(curry) ; takeaway }
  it "shows formatted list of items to user" do
    takeaway = Takeaway.new({chips: 2, curry: 3.25})
    expect{takeaway.show_items}.to output("1. Chips: £2.00\n2. Curry: £3.25").to_stdout
  end

  # it "allows users to order items" do
  #   allow($stdin).to receive(:gets).and_return('Chips')
  #   takeaway_with_items.make_selection
  #   # allow($stdin).to receive(:gets).and_return(2)
  #   # expect(selection.order).to eq something
  # end
end
#
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
