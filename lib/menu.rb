class Menu

  attr_reader :list

  def initialize(list)
    @list = list

  end

  def generator
    @list.map do |name,index|
        "#{name}: £#{index}"
    end.join(" ")
  end
end
