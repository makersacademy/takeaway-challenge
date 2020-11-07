require 'ramen_bar'

describe RamenBar do 
  
  it "initializes with dishes" do 
    expect(subject.dishes).to eq( 
  [
    {:name => 'tonkotsu', :price => 10}, 
    {:name => 'kakugiri', :price => 9 },
    {:name => 'shoyu',    :price => 9 },
    {:name => 'gyoza',    :price => 5 },
    {:name => 'edamame',  :price => 3 },
  ]
  )
  end

  it "has a display menu function" do 
    expect(subject).to respond_to(:menu)
  end


end