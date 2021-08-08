require "./lib/menu.rb"

describe Menu do

  it "shows the Menu class to have @dishes" do
    expect(subject).to respond_to :dishes
  end



end
