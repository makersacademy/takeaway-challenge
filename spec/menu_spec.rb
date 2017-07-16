require './lib/menu.rb'



describe Menu do
  subject(:menu) { described_class.new }

  it "has a list of dish types" do
    expect(menu).to respond_to :list
  end











end
