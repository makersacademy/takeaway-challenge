require 'menu'

describe Menu do

  it "can add a dish to menu array" do
    subject.add_dish("fish and chips", 5)
    expect(subject.menu.length).to eq 6
  end
  
  it "can view menu" do
    expect(subject.view_menu).to eq [{ :name => "beef burger", :price => 5 }, { :name => "chicken burger", :price => 5 }, { :name => "chicken popcorn", :price => 3 }, { :name => "wrap", :price => 5 }, { :name => "chips", :price => 2 }]
  end

end
