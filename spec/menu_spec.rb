require 'menu'

describe Menu do

  it "initializes with a menu" do
    expect(subject).to have_attributes(:menu => Hash)
  end

  it "responds to show menu" do
    expect(subject).to respond_to :show_menu
  end

end