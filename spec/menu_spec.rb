require 'menu'

describe Menu do

  describe "#initialize" do
    it "should return the menu" do 
    expect(subject.dishes).to eq ({hamburger: 3.99, tacos: 4.99, spaghetti: 5.99, fries: 4.59}) 
  end
end

  describe "#read_menu" do
  it "displays the menu" do
    expect(subject.dishes).to eq ({hamburger: 3.99, tacos: 4.99, spaghetti: 5.99, fries: 4.59}) 
  end
end

end
