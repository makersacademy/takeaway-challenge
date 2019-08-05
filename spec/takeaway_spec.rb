require_relative '../lib/takeaway'

describe Takeaway do
  it "can complete an order" do
    expect(subject).to respond_to(:checkout)
  end

  it "sends an sms" do
    message = "Order complete! We will be with you shortly"
    subject.message_sent = true
    subject.send_sms
    expect(subject.message_sent).to eq true
  end

  it "has a menu" do
    expect(subject.menu).not_to eq nil
  end

  it "can display a menu" do
    menu = subject.menu
    expect(subject.show_menu).to eq menu
  end

  it "can store a request" do
    request = {"spring rolls" => 3.80}
    subject.order(request)
    subject.order(request)
    expect(subject.basket).to eq ["spring rolls", "spring rolls"]
  end

  it "can show current basket contents" do
    request = {item: "spring rolls", price: 3.80}
    basket = subject.basket
    subject.order(request)
    expect(subject.check_basket).to eq basket
  end

  it "can return a total" do
    request = {"spring rolls" => 3.85}
    subject.order(request, 3)
    expect(subject.total).to eq "Total: £11.55"
  end

  it "can list basket corectly with multiples" do
    first_item = {"Paratha" => 2.25 }
    second_item = { "Red Lentil Dhal" => 6.00 }
    subject.order(first_item, 3)
    subject.order(second_item, 2)
    expect(subject.check_basket).to eq "Paratha x 3, Red Lentil Dhal x 2. Total: £19.75"
  end
end
