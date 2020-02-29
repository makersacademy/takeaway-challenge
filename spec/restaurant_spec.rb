require 'restaurant'

describe Restaurant do
  it "can show a menu" do
    menu = double ("menu")
    expect { subject.see_menu }.to output { menu.print_menu }.to_stdout
  end
end
