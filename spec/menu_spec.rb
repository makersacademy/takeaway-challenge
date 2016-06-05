require 'menu'

describe Menu do

let(:menu) {described_class.new}

    it "has a list of dishes" do
      expect(menu.all).to_not eq nil
    end

end