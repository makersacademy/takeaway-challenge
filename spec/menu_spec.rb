require 'menu'

describe Menu do
  it "exists" do
    expect(Menu).to receive(:new)
    Menu.new
  end
  it "contains a list of dishes and prices" do
    menu = Menu.new
    expect(menu.dishes[:trout_snout]).to eq(6.50)
    expect(menu.dishes[:mysterious_dumpling]).to eq(8.00)
    expect(menu.dishes[:hoof_broth]).to eq(3.30)
    expect(menu.dishes).to eq({
      trout_snout: 6.50,
      hog_soup: 4.90,
      mysterious_dumpling: 8.00,
      boring_sandwich: 4.00,
      cuttlefish_pate: 11.00,
      hoof_broth: 3.30
    })
  end
  xit "prints the list of dishes for the customer" do

end
