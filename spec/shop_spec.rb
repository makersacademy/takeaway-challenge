require 'shop.rb'

describe Shop do

  subject( :shop ){ described_class.new }

  context "#menu" do

    it { is_expected.to respond_to :menu }

    it "show a list of dishes" do
      expect( shop.menu ).to be_kind_of( Hash )
    end

    it "show a list of dishes with prices(Float)" do
      price = nil
      ( shop.menu ).each_value{ | value | price = value }
      expect( price ).to be_kind_of( Float )
    end

  end

end
