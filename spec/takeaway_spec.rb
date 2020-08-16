require 'takeaway'

describe Takeaway do 

  subject(:takeaway) { described_class.new(dish: "Pizza", price: "£11.99") }

  it 'displays a menu showing the dishes and prices' do
 
    expect(takeaway.view_menu).to eq({dish:"Pizza", price: "£11.99"})
  
  end

  #subject(:takeaway) { described_class.new }
  
end