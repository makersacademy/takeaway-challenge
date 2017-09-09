require 'menu.rb'
require 'order.rb'

describe Menu do

  let(:dish) {double :dish}

describe 'display' do
  it "should print a list of dishes with prices" do
    expect(@menu.display).to eq(@menu)
  end
end
end
