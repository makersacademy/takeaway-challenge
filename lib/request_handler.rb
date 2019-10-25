require_relative 'dish_manager'

class RequestHandler
  attr_reader :body, :from

  @@dish_manager = DishManager.new('menu.txt')

  def initialize(params)
    @body = params['Body']
    @from = params['From']
  end

  def response
    case @body.lines.first.chomp.downcase
    when 'menu'
      "Menu:\n" + @@dish_manager.pretty_string
    else
      'Type \'menu\' to view the menu'
    end
  end
end