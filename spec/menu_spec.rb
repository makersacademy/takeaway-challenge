require 'menu'

describe Menu do

  describe "#view" do

    it 'displays a list of dishes with prices' do
      expect(subject.view).to eq(subject.dishes_hash)
    end
  end

  describe "#on_menu?" do

  it "returns true if an item is on the menu" do
    expect(subject.on_menu?("Pork")).to eq true
  end

  it "returns false if an item isn't on the menu" do
    expect(subject.on_menu?("Sausage")).to eq false
  end
end

end
