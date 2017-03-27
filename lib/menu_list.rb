
class MenuList

  attr_reader :menu

  def initialize
    @menu = [{:title => 'ROCK', :type => :main, :food => :fish, :price => 5.6},
             {:title => 'PLAICE', :type => :main, :food => :fish,:price =>	5.6},
             {:title => 'HADDOCK', :type => :main,	:food => :fish,:price => 5.6},
             {:title => 'COD BITES (6)', :type => :main, :food => :fish,:price => 5.0},
             {:title => 'CHIPS',	:type => :side, :food => :chips,:price =>	1.8},
             {:title => 'CHIP BUTTY', :type => :side, :food => :chips,:price =>	2.0},
             {:title => 'CHIPS & CHEESE', :type => :side, :food => :chips,:price =>	3.2},
             {:title => 'CHICKEN LEG', :type => :main, :food => :chicken,:price =>	2.8},
             {:title => 'CHICKEN BREAST', :type => :main,	:food => :chicken,:price =>	3.2},
             {:title => 'HALF CHICKEN', :type => :main,	:food => :chicken,:price =>	5.4},
             {:title => 'JUMBO SAUSAGE', :type => :main,	:food => :sausages,:price =>	1.7},
             {:title => 'CHICKEN SAVELOY', :type => :main, :food => :sausages,:price =>	1.7},
             {:title => 'SAUSAGE IN BATTER', :type => :main, :food => :sausages,:price =>	1.8},
             {:title => 'PICKLED ONION',	:type => :side,	:food => :extras,:price =>	0.3},
             {:title => 'COD ROE',	:type => :side, :food => :extras, :price =>	2.0},
             {:title => 'FISHCAKE',	:type => :side, :food => :extras,:price =>	2.2},
             {:title => 'VINEGAR',	:type => :side,	:food => :extras, :price =>	0.3}]
  end

  def print_menu
    menu.each_with_index do |x,i|
      STDOUT.puts "#{i + 1}. #{x[:title]} === #{x[:price]}".center(40)
    end
  end

  def get_price(x)
    menu[x-1][:price]
  end

  def get_title(x)
    menu[x-1][:title]
  end
end
