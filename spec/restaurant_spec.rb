require 'restaurant'

describe Restaurant do 

  # let(:list_of_dishes) {{:burger => 10, :pizza => 5}}
  let(:dish) {"burger"}

  it {is_expected.to respond_to(:list_of_dishes)}
  it {is_expected.to respond_to(:select_dish).with(1).argument}

  it "shows dishes" do 
    #expect(subject.list_of_dishes).to include (:burger) 
    expect(subject.read_menu).to eq subject.list_of_dishes
  end 

  describe "#select_dishes" do 
    it "should select dishes" do 
    subject.select_dish(dish)
    expect(subject.order).to have_key(dish)
    end 
  end 


  #need to include an error if not available. similar to the exclude
  
end