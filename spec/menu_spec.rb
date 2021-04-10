require 'menu'

describe Menu do

  it { is_expected.to be_an_instance_of Menu }

  it "stores the menu as a hash" do
    expect(subject.dish).to be_an_instance_of Hash
  end

  it "responds to the show menu method" do
    expect(subject).to respond_to(:show_menu)
  end

  it "can retrun the each dish with it's corresponding price as a string" do
    expect(subject.show_menu).to be_an_instance_of String
  end

end
