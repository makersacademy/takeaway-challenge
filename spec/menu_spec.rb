require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it "list all the dishes available to select" do
    expect(menu.list_dishes).to be_an_instance_of Hash
  end
end