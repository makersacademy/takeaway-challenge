require 'google_sheet'

describe Menu do

  context 'reads data from google sheet' do

    let(:data) {{ "1"=> { :name => "Tomato Soup", :price => 5 }, "2" =>{ :name => "Avocado On Toast", :price => 7 }, "3" => { :name => "Spaghetti Bolognese", :price => 12 }, "4" => { :name => "Mushroom Surprise", :price => 9 }, "5" => { :name => "Pizza", :price => 10 }, "6" => { :name => "Ice Cream", :price => 4}, "7" =>{ :name => "Cake", :price => 4 }}}


    it 'returns "order will arrive in 1 hour from now' do
      subject.get_dishes
      expect(subject.dishes).to eq data
    end


    
  end

end