require 'menu'

describe Menu do
  let(:penne) {Dish.new("Penne con la sabbia", 3)}

  it "should have a list of dishes" do
    expect(subject.menu).to include({dish: "cianfrusaglie alla rinfusa", price: 3})
  end

  describe "#entry" do
    it 'should add the dish to the menu' do
      subject.entry(penne)
      expect(subject.menu).to include({dish: "Penne con la sabbia", price: 3})
    end
  end

end
