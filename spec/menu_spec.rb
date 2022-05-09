require 'Menu'

describe Menu do

  let(:dishes) { double :dishes }

  it 'initializes with a menu' do
    subject = Menu.new(dishes)
    expect(subject.dishes).to eq dishes
  end

end
