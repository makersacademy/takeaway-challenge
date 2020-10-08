require 'Menu'

describe Menu do
  let(:curry) {double(:dish, name: 'Curry', price: 8)}
  let(:rice) {double(:dish, name: 'Rice', price: 3)}
  let(:menu) {Menu.new([curry,rice])}
  it "starts with a non-empty list of dishes" do
    expect(menu.dishes.length).to be > 0
  end

  it "can print its contents" do
    menu_output = "Menu:\nCurry - £8\nRice - £3\n"
    expect{ menu.print }.to output(menu_output).to_stdout
  end
end