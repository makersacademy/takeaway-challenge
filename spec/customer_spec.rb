require 'customer'

describe Customer do
  let(:order) {double :order}

  it "can place order" do
    expect(subject).to respond_to(:place_order)
  end
  describe '#get_name' do
    let(:customer) {Customer.new}
    it "can get name" do
      allow(customer.get_name).to receive(:gets).and_return("owen")
      expect(customer.name).to eq "owen"
    end
  end

  it "can get phone number" do
    expect(subject).to respond_to(:get_phone)
  end

  it "can get set phone number" do
    subject.phone_number = 7192329884
    expect(subject.phone_number).to eq 7192329884
  end

  it "can get food order" do
    expect(subject).to respond_to(:see_menu)
  end

  it "can get quantity of order" do
    expect(subject).to respond_to(:get_quantity)
  end

  it "can get price" do
    expect(subject).to respond_to(:get_price)
  end

  it "can display the menu" do
    expect(subject.see_menu).to include?("hamburger:6.0")
  end

  it "can get order confirmation" do
    expect(subject.get_confirmation('y')).to puts  "Order up! You will receive a text confirmation."
  end

end
