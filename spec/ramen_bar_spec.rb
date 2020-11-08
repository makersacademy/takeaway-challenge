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
    expect(subject).to respond_to(:order)
  end

end