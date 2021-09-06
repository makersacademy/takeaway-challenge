require 'restaurant'

describe Restaurant do
  
  it "shows the menu" do
    menu = "Fries - £2\nMilkshake - £4\n"
    expect { subject.display_menu }.to output(menu).to_stdout
  end

end