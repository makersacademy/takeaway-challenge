require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  describe '#initialize'
  it "creates a new menu" do
    expect(menu.dishes).to eq menu.dishes 
  end

end
