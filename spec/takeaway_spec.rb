require 'takeaway'

describe Takeaway do

  let(:takeaway) { subject }
  let(:menu) { { potato_smilies: 2,
                 turkey_twizzlers: 3,
                 rice_pudding: 3,
                 panda_pop: 1,
                 spaghetti_hoops: 1
                 } }

  it "should create a menu when initialized" do
    expect(takeaway.menu).to eq menu
  end

  it "should create a new Basket when initialized" do
    expect(takeaway).to respond_to(:basket)
  end

end
