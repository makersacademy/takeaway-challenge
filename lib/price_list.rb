class PriceList
  attr_reader :list

  def initialize(menu = {})
    @list = menu
  end

  def print
    @list.each do |k, v|
      puts "#{k.capitalize}: #{v}"
    end
  end
end
