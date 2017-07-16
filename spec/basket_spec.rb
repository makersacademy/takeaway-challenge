require "./lib/basket.rb"

RSpec.describe Basket do
let(:basket) { Basket.new }
  it { expect(subject.basket).to be_a(Hash) }
  it { expect(subject).to respond_to(:view_basket) }
  it { expect(subject).to respond_to(:add_to_basket) }
  it { expect(subject).to respond_to(:remove_from_basket) }
  it { expect(subject).to respond_to(:check_out) }

  it "checks item is added to the basket" do
    item = "a dish"
    subject.add_to_basket(item)
    expect(subject.basket).to have_key(item)
  end

  it "checks item is removed from the basket" do
    item = "a dish"
    subject.add_to_basket(item)
    subject.remove_from_basket(item)
    expect((subject.basket).has_key?(item)).to be false
  end
end
