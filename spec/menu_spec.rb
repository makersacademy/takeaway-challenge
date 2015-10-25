require "menu"

describe Menu do

  let(:menu){ {
    'hamburger' => 2,
    'pasta'     => 4,
    'burrito'   => 3,
    'lasagna'   => 5
  } }

  it {is_expected.to respond_to(:dishes)}

  it "expect to print a menu with all the dishes and the prices" do
    expect(subject.dishes).to eq(menu)
  end

end
