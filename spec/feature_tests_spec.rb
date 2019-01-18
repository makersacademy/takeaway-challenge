# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'display'
require 'takeaway'

describe "showing items to user" do
  let(:chips) {{name: 'chips', price: 2}}
  let(:curry) {{name: 'curry', price: 3.25}}
  it "shows formatted list of items to user" do
    takeaway = Takeaway.new
    takeaway.add_item(chips)
    takeaway.add_item(curry)
    expect{takeaway.show_items}.to output("1. Chips: £2.00\n2. Curry: £3.25").to_stdout
  end
end
