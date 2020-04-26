require 'menu'

describe Menu do
  
  it "Is able to store a list of dishes with name and price." do
      subject.add_dish("Special", "8.50")
      expect(subject.items).to contain_exactly(:name => "Special", :price => "8.50")
    end

end
