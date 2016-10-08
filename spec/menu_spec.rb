require 'menu.rb'

describe class Menu
describe 'display' do
  it "should print a list of dishes with prices" do
    expect(@menu.display).to eq(@menu)
  end
end
end
