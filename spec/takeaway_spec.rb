require 'takeaway'

describe Takeaway do 

subject(:takeaway) {described_class.new}
  
  it { should respond_to(:order) }


  it 'displays a list of dishes' do 
  expect(takeaway.list_menu).to include ("Roast Pork Belly Hirata Buns")
  end

  # it 'allows you to select a dish from the menu' do 
  # takeaway.select_item("Roast Pork Belly Hirata Buns")
  # expect(takeaway.order).to include ("Roast Pork Belly Hirata Buns")
  # end

end

