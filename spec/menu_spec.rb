require 'menu'

describe Menu do

  it { is_expected.to be_an_instance_of Menu}

  it "responds to the show menu method" do
    expect(subject).to respond_to(:show_menu)
  end

end
