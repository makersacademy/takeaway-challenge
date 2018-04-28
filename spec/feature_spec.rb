require './spec/spec_helper.rb'

feature "Take Away Challenge" do

let(:dishes) {Dishes.new}
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  scenario "Get list of dishes and prices" do
    expect(dishes.list.count).to eq 7
  end

end
