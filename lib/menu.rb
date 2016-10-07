require_relative 'takeaway'

class Menu

attr_reader :menu

  def initialize
    #think about importing dishes(csv?) later but get everthing else working for now
    @dishes = {'Hamburger':    '£4.50',
               'Cheeseburger': '£5.00'
    }
  end

  def show
    @dishes.each do |food, price|
      puts "#{food}: #{price}"
    end
  end

end
