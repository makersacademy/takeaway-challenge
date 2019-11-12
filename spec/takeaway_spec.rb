require 'takeaway'

describe Takeaway do
  subject(:takeaway) {Takeaway.new}
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "lets you check the list of dishes" do
    takeaway = Takeaway.new
    takeaway.view_menu
    expect(subject.list_of_dishes).to eq [:dish1 => "£7", :dish2 => "£14", :dish3 => "£15"]
end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it "lets you select some number of several available dishes" do
    subject.select_item("dish1")
    subject.select_item("dish2")
    expect(subject.dish_selection).to eq [{:dish1 => "£7", :dish3 => "£15"}]
end
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "lets you view your order" do
  subject.select_item("dish1")
  subject.select_item("dish2")
  subject.view_order
  expect(subject.order).to eq [{:dish1 => "£7", :dish3 => "£15"}]
end
end
