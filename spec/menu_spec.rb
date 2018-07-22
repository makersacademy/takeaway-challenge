require "menu"
describe Menu do
  subject(:menu) { Menu.new }

  it "respnds to dish method" do
    expect(menu).to respond_to(:dish)
  end

end
