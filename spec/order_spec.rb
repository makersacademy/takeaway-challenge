require 'order'

describe Order do

  before do
    @menu = Menu.new
  end

  it 'should return the menu' do
    expect(subject.read_menu).to eq(@menu.menu)
  end

  it { should respond_to(:add).with(2).arguments }

  it 'should add the selected dish to the basket, along with the selected amount' do
    first_item = subject.add("1. Bhindi", 5)
    expect(subject.basket).to be(first_item)
  end

end
