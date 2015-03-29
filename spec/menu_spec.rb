require 'menu'

describe Menu do

  let(:menu) { Menu.new }
  let(:item) { double :item } 

  it "can have hash of items" do
    menu.add_item :code, 12
    expect(menu.items[:code]).to eq 12

  end  
end
