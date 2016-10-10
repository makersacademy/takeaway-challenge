require 'menu'

describe Menu do
    # let(:menu) do
    #   [ {dish: "cianfrusaglie alla rinfusa", price: 3},
    #   {dish: "raudi accesi", price: 3},
    #   {dish: "fragole alla carbonara", price: 14}]
    # end

    it "should have a list of dishes" do
      expect(subject.menu).to include({dish: "cianfrusaglie alla rinfusa", price: 3})
    end

    # describe "#entry" do
    #   it 'should add the dish to the menu' do
    #     # subject.entry(penne)
    #     # subject.entry(biscottini)
    #     expect(subject.menu).to eq(menu)
    #   end
    # end

end
