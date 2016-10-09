require 'menu.rb'

describe Menu do

  let(:dish) {double :dish}
  let(:dish_choice) {double :dish_choice}

describe 'display' do
  it "should print a list of dishes with prices" do
    expect(@menu.display).to eq(@menu)
  end
end

end
