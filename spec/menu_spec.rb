require "menu"

describe Menu do

  describe "attributes" do

    subject(:menu) { described_class.new("spring roll", 2) }

    it "should expose dish name variable" do
      expect(menu.name).to eq "spring roll"
    end

    it "should expose dish price variable" do
      expect(menu.price).to eq 2
    end

    it "should create a dish variable" do
      expect(subject.dish).to eql({ :name => "spring roll", :price => 2 })
    end

    it "can check the menu" do
      expect(subject.check_menu).to eq []
    end

  end

  # it 'can check the menu dishes' do
  #   subject.check_menu
  #   expect(subject.menu).to include dish
  # end
  #
  # it 'can check the menu prices' do
  #   subject.check_menu
  #   expect(subject.menu).to include price
  # end

end
