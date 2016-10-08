require 'menu'



describe Menu do

subject(:menu) { described_class.new }

  it "is a hash with a number of dishes with prices" do
    expect(menu.menu_list).to be_an_instance_of(Hash)
  end

end
