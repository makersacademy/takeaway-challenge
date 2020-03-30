class Menu

  attr_reader :list

  def initialize
    @list = {
      :fish => "£5",
      :chips => "£3",
      :salad => "£2",
    }
  end

end
