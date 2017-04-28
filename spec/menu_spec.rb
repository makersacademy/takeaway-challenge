require 'menu'

describe 'Menu' do
  subject = Menu.new

  it 'starts with an empty list' do
    expect(subject.list).to eq []
  end

  it 'displays the menu' do
    subject.load_menu("test_menu.csv")
    allow(subject).to receive(:puts)
    expect(subject.display_menu).to eq [{ :item_code => "test", :item_name => nil, :item_price => 0 }]
  end

end
