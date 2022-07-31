require 'menu'

describe Menu do
  it "should present a range of dishes" do
    menu = Menu.new
    expect { menu.see }.to output.to_stdout
  end
end
