require 'takeaway'

describe Takeaway do
  subject(:takeaway) {Takeaway.new}
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "lets you check the list of dishes" do
    takeaway = Takeaway.new
    dishes.check_takeawaydishes
    gets.chomp = "Y"
    expect(subject.list_of_dishes).to eq [{:dish1 => "£price1", :dish2 => "£price2", :dish3 => "£price3"}]
end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it "lets you select some number of several available dishes" do
    subject.select_takeawaydishes("dish1")
    subject.select_takeawaydishes("dish2")
    expect(subject.dish_selection).to eq [{:dish1 => "£price1", :dish3 => "£price3"}]
end
end
