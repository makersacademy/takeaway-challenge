require 'menu.rb'

describe Menu do

  let(:menu) { [{:dish => "Cod", :price => 8.25}] }
  let(:cod) { "Cod" }

  it 'should return a menu' do
    expect(subject.view_menu).to eq(Menu::MENU)
  end

  it 'should return a formatted menu' do
    expect(subject.view_formatted_menu(menu)).to eq "Cod - £8.25"
  end

  it 'should validate if an item exists' do
    expect(subject.contains?("Cod")).to eq true
  end

end