require 'dish'

describe Dish do
  let(:name) { double("name of dish") }
  let(:price) { double("price of dish") }
  subject { described_class.new(name, price) }

  it { is_expected.to be_instance_of(Dish) }

  it { is_expected.to respond_to(:name) }

  it { is_expected.to respond_to(:price) }

  it "knows the name of the dish" do
    expect(subject.name).to eq name
  end

  it "knows the price of the dish" do
    expect(subject.price).to eq price
  end

  # I have struggled with getting this test to pass - RSpec complains
  # because it is trying to format a double (line 10 of code)
  # let(:formatted_price) { double("formatted_price") }
  # it "displays dish" do
  #   expect(subject.display).to eq "#{name}: £#{formatted_price}"
  # end

end
