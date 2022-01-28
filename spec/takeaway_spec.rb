require 'takeaway'

describe Takeaway do
  it 'lists dishes with prices in a menu' do
    expect(subject.menu).to eq({ "pizza" => "£4.50", "chips" => "£2", 
    "kebab" => "£3" })  
  end
end