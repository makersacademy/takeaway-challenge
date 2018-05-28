require 'menu_list'

describe Menu_list do

  it "includes the list of menu items" do
    expect(subject.menu_list).to be_an Array
  end

end
