require 'menu'

describe Menu do

  let(:subject) { Menu.new({ "kimchi" => 5 }) }

  it "should have dishes" do
    expect(subject.dishes).to eq({ "kimchi" => 5 })
  end

end
