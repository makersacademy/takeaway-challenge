require 'menu'

describe Menu do
  subject(:list) { described_class.new }
  fake_menu = {dumplings: 5, udon: 6, curry: 5, beer: 4}

  it "lets customers view menu" do
    expect(list).to respond_to(:view)
  end

  it "displays menu properly" do
    allow(list).to receive(:menu).and_return(fake_menu)
    view_menu = "dumplings, £5; udon, £6; curry, £5; beer, £4"
    expect(list.view).to eq(view_menu)
  end
end
