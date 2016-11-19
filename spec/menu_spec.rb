require "menu"

describe Menu do
  subject(:menu) {described_class.new}

  it "should display a welcome to the resturaunt" do
    expect(menu.welcome).to eq "Welcome to Dan's Mexican Resturaunt."
  end

  it "should display a list of menu items" do
    expect{menu.list_menu}.to output.to_stdout
  end

end
