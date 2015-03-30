require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:list) { menu.list }

  it "has a list of menu items" do
    expect(menu).to respond_to :list
  end

  it "can add items to it's menu" do
    menu.add_item(:solid_spam_stew, 1.00)
    expect(menu.list.count).to eq 3
  end

  it "can display list of menu items" do
    expect(menu.show_menu).to eq list
  end

  it "can receive order from customer" do
    menu.receive_order(:sloppy_sandwich)
    expect(menu.basket[:sloppy_sandwich]).to eq menu.list[:sloppy_sandwich]
  end

  it "can send a text " do
    
  end
end