require 'menu'

describe Menu do
  it "initializes with a list of menu items" do
    expect(subject.see_menu).to include("sandwhich" => 3.20)
  end
end
