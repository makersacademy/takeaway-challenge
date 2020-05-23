require 'takeaway'

describe TakeAway do
  it 'should have a user scrutable menu' do
    expect(subject).to respond_to :menu
  end

  it "will have a menu value" do
    expect(subject.menu).not_to eq nil
  end
end
