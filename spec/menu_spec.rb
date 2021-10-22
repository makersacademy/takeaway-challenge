require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context 'shows a list of dishes with prices' do
    it "cheks meals" do 
        expect(menu).to include (:pizza)
        expect(menu[:pizza]).to eq 10
    end 
    it "cheks meals" do 
        expect(menu).to include (:pasta)
    expect(menu[:pasta]).to eq 8
    end
    it "cheks meals" do 
        expect(menu).to include (:salad)
        expect(menu[:salad]).to eq 5
    end
  end
end