require "menu"

describe Menu do

  subject(:menu){ described_class.new }
  let(:menu_r){ {
    'hamburger' => 2,
    'pasta'     => 4,
    'burrito'   => 3,
    'lasagna'   => 5
  } }

  it "expect to print a menu with all the dishes and the prices" do
    expect(menu.dishes).to eq(menu_r)
  end

end
