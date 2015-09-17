require 'menu.rb'

describe Menu do

  it "displays menu list" do
   expect(subject.menu_pricelist["chicken katsu"]).to eq(3.5)
  end

end