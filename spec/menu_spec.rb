require "menu"

describe Menu do

  it "should respond to add menu" do
    expect(subject).to respond_to(:menu_items)
  end

end
