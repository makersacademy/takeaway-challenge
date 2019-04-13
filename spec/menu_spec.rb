require 'menu'

describe Menu do

  it 'allows user to view a list of food items and prices' do
    expect(subject.menu_list).to include(
      {:dish => "kebab" , :price => 5 },
      {:dish => "curry" , :price => 6 },
      {:dish => "pizza" , :price => 4 },
      {:dish => "sushi" , :price => 8 },
      {:dish => "burrito" , :price => 6 }
    )
  end

  describe '#initialize' do
    it 'initially creates an empty basket' do
      expect(subject.basket).to be_empty
    end
  end


  



end
