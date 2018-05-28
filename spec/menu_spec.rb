require 'menu'

describe Menu do

  it 'takes a choice' do
    expect(subject).to respond_to(:item).with(1).argument
  end

  it 'contains one or more choice' do
    menu = Menu.new
    menu.item(1)
    menu.order[1]
    expect(menu.order).to eq [[1, "Roast Duck in Sour Plum Sauce", 6.2]]
  end

  it "contains the total of prices" do
    menu = Menu.new
    menu.item(1)
    expect(menu.prices).to be_nonzero
  end

end
