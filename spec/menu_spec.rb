require 'menu'

describe Menu do
  it { is_expected.to respond_to(:food_list) }
  it { is_expected.to respond_to(:display_menu) }

  describe "#food_list" do
    it "should return a hash" do
      expect( subject.food_list ).to be_a Hash
    end

    it "should initialize with food" do
      expect( subject.food_list ).not_to be_empty
    end
  end

  describe "#display_menu" do
    it "should return a formatted food list" do
      expect{ subject.display_menu }.to output{ subject.food_list }.to_stdout
    end
  end

end
