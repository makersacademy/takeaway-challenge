require 'dishes'

describe Dishes do
  it 'creates an instance of Dishes' do
    dishes = Dishes.new
    expect(dishes).to be_an_instance_of(Dishes)
  end

  it 'should create a list of dishes' do
    dishes = Dishes.new
    #expect(dishes).to respond_to(:create_list)
    expect(dishes.create_list).to contain_exactly{"fish, chicken, curry, pizza, vegetarian"}
  end

  #it 'should create a menu' do
  #  dishes = Dishes.new
  #  menu = dishes.create_list
  #end

end
