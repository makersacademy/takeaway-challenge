require 'menu'

describe Menu do
  it "includes an array of instances of MenuItem" do
    expect(Menu::ITEMS[0]).to be_an_instance_of(MenuItem)
  end

  it 'displays the menu' do 
    expect{Menu.view.to output.to_stdout}
  end
end
