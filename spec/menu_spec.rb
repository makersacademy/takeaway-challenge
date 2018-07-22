require "menu"
describe Menu do
  subject(:menu) { Menu.new }

  it "returns a dish object" do
    expect(menu.dish).to be_an_instance_of(Dish)
  end

end
