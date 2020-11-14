require 'dishes'

describe Dishes do
  it 'creates an instance of Dishes' do
    dishes = Dishes.new
    expect(dishes).to be_an_instance_of(Dishes)
  end

  it 'should create a list of dishes' do
    dishes = Dishes.new
    #expect(dishes).to respond_to(:create_list)
    expect(dishes.create_list).to contain_exactly{"fish £6, chicken £7, curry £5, pizza £4, vegetarian £3"}
  end

  #it 'should create a menu' do
  #  dishes = Dishes.new
  #  menu = dishes.create_list
  #end

end
