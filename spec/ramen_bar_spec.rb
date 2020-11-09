require 'ramen_bar'

describe RamenBar do 
  
  it "initializes with dishes" do 
    expect(subject.dishes).to eq( 
      {
        'tonkotsu' => 10,
        'kakugiri' => 9,
        'shoyu'    => 9,
        'gyoza'    => 5,
        'edamame'  => 3
      }
  )
  end

  it "has a display menu function" do 
    expect(subject).to respond_to(:menu)
  end

  it "has an oder function that asks for your order" do 
    expect(subject).to respond_to(:order_meal)
  end

  it "will store a users order (dish & quantity)" do 
    subject.order_meal('tonkotsu',5)
    expect(subject.order).to eq ['tonkotsu','tonkotsu','tonkotsu','tonkotsu','tonkotsu']
  end

  it "will store a users order (dish & quantity)" do 
    subject.order_meal('tonkotsu',5)
    expect(subject.order).to eq ['tonkotsu','tonkotsu','tonkotsu','tonkotsu','tonkotsu']
  end

  it "will return the total cost of the users order" do
    subject.order_meal('tonkotsu',5)
    subject.total
    expect(subject.total_order).to eq(50)
  end

  it "will return the total cost of the users order" do
    subject.order_meal('gyoza',2)
    subject.order_meal('kakugiri',1)
    subject.total
    expect(subject.total_order).to eq(19)
  end

end