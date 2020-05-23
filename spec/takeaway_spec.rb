require 'takeaway'

describe TakeAway do
let(:takeaway) {TakeAway.new}
let(:bum) { Menu.new }

  it 'should have a user scrutable menu' do
    expect(subject.menu).not_to be nil
  end

  it "shows the user the menu" do
    expect(subject.seemenu).to eq [{ "dimsum" => 3 }, { "soup" => 4 }, { "noodles" => 6 }, { "rice" => 7 }]
  end

  it "accepts responds to order" do
    expect(takeaway).to respond_to :order
  end



end
