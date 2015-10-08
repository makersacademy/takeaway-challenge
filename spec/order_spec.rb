describe Order do
  let(:menu) do
    double :menu,
    show: [{dish: 'BBQ',       price: 10},
           {dish: 'Sushi',     price: 6}]
  end

  it "has customer choose a dish and quantities" do
    expect(subject.choose_dish(menu, 'BBQ', 3))
      .to eq([{dish: 'BBQ', price: 10, quantities: 3}])
  end

  it "accepts more than one dish" do
    subject.choose_dish(menu, 'BBQ', 3)
    subject.choose_dish(menu, 'Sushi', 3)
    expect(subject.orders).to eq([{dish: 'BBQ', price: 10, quantities: 3},
                                 {dish: 'Sushi', price: 6, quantities: 3}])
  end

  it "shows the total amount" do
    subject.choose_dish(menu, 'BBQ', 3)
    subject.choose_dish(menu, 'Sushi', 3)
    expect(subject.checkout)
      .to eq("BBQ: 3 * 10 = 30 | Sushi: 3 * 6 = 18 | The total amount is £48")
  end

  it "can be canceled" do
    subject.choose_dish(menu, 'BBQ', 3)
    subject.cancel_orders
    expect(subject.orders).to eq([])
  end

  describe "#pay(price)" do
    let(:customer) { double :customer, name: 'Jongmin',
      phone_number: '+44 7497 811148'}
  
    before do
      subject.choose_dish(menu, 'BBQ', 4)
      subject.choose_dish(menu, 'Sushi', 4)
      subject.checkout
    end

    it "sets :paid property to true" do
      subject.pay(64, customer)
      expect(subject.orders.first[:paid]).to be true
      expect(subject.orders.last[:paid]).to be true
    end

    it "doesn't place orders when you don't pay exact amount" do
      expect { subject.pay(30, customer) }
        .to raise_error('You are not paying the exact amount')
    end

    it 'stores the time you place an order' do
      subject.pay(64, customer)
      expect(subject.orders.first[:created_at]).to eq(Time.now.strftime("%b %e, %Y %H:%M"))
    end

    it 'sends customers text message when order is placed' do
      expect(Text).to receive(:send_text_message)
      subject.pay(64, customer)
    end
  end
end
