require 'takeaway'

describe Takeaway do 

subject(:takeaway) {described_class.new}
  
describe "#list_menu" do 
 
  it 'displays a list of dishes' do 
  expect(takeaway.list_menu).to include ("Roast Pork Belly Hirata Buns")
  end

end

describe "#select_item" do 

  it { should respond_to(:select_item).with(2).arguments }

  it 'allows you to select a dish from the menu' do 
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  expect(takeaway.order).to include ("Roast Pork Belly Hirata Buns")
  end

  it 'allows you to select multple items from the menu' do
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  takeaway.select_item("Salt & Pepper Squid",2)
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  expect(takeaway.order).to eq ["Roast Pork Belly Hirata Buns", "Salt & Pepper Squid", "Salt & Pepper Squid", "Roast Pork Belly Hirata Buns"]
  end
  
  it 'confirms the items you have selected' do 
  expect(takeaway.select_item("Roast Pork Belly Hirata Buns",2)).to eq "you added 2 Roast Pork Belly Hirata Buns to your basket"
  end


end

end

