require 'customer.rb'
require 'twilio'

describe Customer do

  it {is_expected.to respond_to(:make_order).with(2).argument}

  it "raises error if customer selects a dish that's not on the menu" do
    expect{ subject.make_order("pasta", 1) }.to raise_error
    "Sorry! That dish is not on the menu"
  end

  it "can select a dish and quantity" do
    subject.make_order("chicken katsu", 2)
    expect( subject.order["chicken katsu"] ).to eq(2)
  end

  it "can select some number of several available dishes" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("miso soup", 2)
    expect(subject.order).to eq("chicken katsu" => 2, "miso soup" => 2)
  end

  it "can will add the quantity of a dish if ordered again" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("chicken katsu", 2)
    expect( subject.order["chicken katsu"] ).to eq(4)
  end

  it "update order if customer changes mind" do
    subject.make_order("chicken katsu", 2)
    subject.update_order("chicken katsu", 1)
    expect( subject.order["chicken katsu"] ).to eq(1)
  end

  it "provides a summary of the total order" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("miso soup", 2)
    expect(subject.order_summary).to eq (
    "You have ordered: 2 chicken katsu, 2 miso soup")
  end

  it "calculates total order" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("miso soup", 2)
    expect(subject.charge).to eq ("You've ordered 4 dishes and cost is £10.00.")
  end

  it "gives the total number of items ordered" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("miso soup", 2)
    expect(subject.total_dishes).to eq(4)
  end

  it "customer can revoke order" do
    expect(subject.confirm_order("n")).to eq("Cancel or revise order.")
  end

  let(:mock_api) { double :api }
  before { allow(subject).to receive(:send_text) { mock_api } }

    it "sends a text upon order confirmation" do
      allow(mock_api).to receive(:sms).with(+447514209436)
      message = "Thank you! A text confirmation will be sent shortly."
      expect(subject.confirm_order("y")).to eq(message)
    end

end
