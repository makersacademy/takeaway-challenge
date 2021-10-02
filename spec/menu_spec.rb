require 'menu'

describe Menu do
  it "includes an array of instances of MenuItem" do
    expect(Menu::ITEMS[0]).to be_an_instance_of(MenuItem)
  end

  it 'displays the menu' do 
    expect { Menu.view.to output.to_stdout }
  end

  it "displays the menu's title" do 
    expect { Menu.view.to output.to_include ("Pizza Takeaway\n==============") }
  end

  it "tells the number of items in the menu" do
    menu = Menu.view
    expect(menu.count).to eq(6)
  end
end
