require 'takeaway'

describe Takeaway do 

subject(:takeaway) { described_class.new }
  
  it 'displays an empty menu hash' do
    expect(takeaway.view_menu).to be_empty
  end

  it 'displays a menu showing the dishes and prices' do
  subject(:takeaway) { described_class.new(dish: "Pizza", price: "£11.99") }
  let(:dish) {double "dish"}
  let(:price) {double "price"}

  expect(takeaway.view_menu).to eq(dish:"Pizza", price: "£11.99")
  
  end

  
  
end