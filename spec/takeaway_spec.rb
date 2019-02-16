require 'takeaway'

describe Menu do

  it 'menu is truthy' do
    menu = Menu.new
    expect(menu.list.any? {|hash| hash["Chinese"] == 8}).to be true

  end

  it "menu is falsy" do
    menu = Menu.new
    expect(menu.list.any? {|hash| hash["Indian"] == 10}).to be false
  end

end
