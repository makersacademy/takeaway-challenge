require 'takeaway.rb'

describe Takeaway do

  it "responds to the method show_menu" do
    expect(subject).to respond_to(:show_menu)
  end

  it "shows the menu when passed method show_menu" do
    expect(subject.show_menu).to be_a(Menu)
  end

  it "responds to the method add" do
    expect(subject).to respond_to(:add)
  end

  it "responds to the method add with two argument" do
    expect(subject).to respond_to(:add).with(2).arguments
  end

  it "adds item selected to basket" do
    subject.add("spring roll", 1)
    expect(subject.basket).to eq({ "spring roll" => 1 })
  end

  it "adds a number of an item selected" do
    subject.add("spring roll", 3)
    expect(subject.basket).to eq({ "spring roll" => 3 })
  end

  it "allows adding an item multiple times" do
    subject.add("spring roll", 2)
    subject.add("spring roll", 3)
    expect(subject.basket).to eq({ "spring roll" => 5 })
  end

  it "shows basket contents when passed basket_summary" do
    subject.add("spring roll", 1)
    subject.add("peking duck", 1)
    expect(subject.basket_summary).to eq("1 spring roll = £0.99, 1 peking duck = £7.99")
  end

  it "shows basket contents when passed basket_summary" do
    subject.add("spring roll", 2)
    expect(subject.basket_summary).to eq("2 spring roll = £1.98")
  end

  it "shows the total price of items when passed total" do
    subject.add("spring roll", 2)
    subject.add("peking duck", 1)
    expect(subject.total).to eq("£9.97")
  end

  it "responds to the method checkout" do
    expect(subject).to respond_to(:checkout)
  end

  it "sends an sms when the client checks out" do
    subject.checkout
    client = double("client")
    api = double("api")
    account = double("account")
    messages = double("messages")
    allow(subject).to receive(:client) { client }
    allow(client).to receive(:api) { api }
    allow(api).to receive(:account) { account }
    allow(account).to receive(:messages) { messages }
    allow(messages).to receive(:create)
    expect(subject.client.api.account.messages).to receive(:create)
  end

end
