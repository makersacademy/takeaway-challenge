require_relative '../lib/menu'

describe Menu do

 describe "#lists_dishes" do

  it' shows a list of all dishes with prices' do
    menu = Menu.new
    expect(subject).to respond_to(:lists_dishes)
    
  end
 end  
end
  


