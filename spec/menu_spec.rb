require 'menu.rb'

describe Menu do

  let(:menu) { [{:dish => "Cod", :price => 8.25}] }
  let(:cod) { {:dish => "Cod", :price => 8.25} }

  it 'should return a menu' do
    expect(subject.view_menu).to eq(Menu::MENU)
  end

  it 'should return a formatted menu' do
    expect(subject.view_formatted_menu(menu)).to eq "Cod - £8.25"
  end

  it 'should return true if the item exists' do
    expect(subject.contains?("Cod")).to eq true
  end

  it 'should return false if an item does not exist' do
    expect(subject.contains?("Spanner")).to eq false
  end

  it 'should return an items price' do
    expect(subject.find_price_for("Cod")).to eq 8.25
  end

end