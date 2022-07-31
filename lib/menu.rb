class Menu
  attr_reader :options

  def initialize
    @options = {
      'rice' => 3,
      'chips' => 3,
      'bread' => 2,
      'burger' => 10,
      'chicken pie' =>10,
      'steak' => 12,
      'fish and chips' => 10 }
end

def see_menu
  @options.each {|k, v|
    "#{k}, #{v}"}
end

def has?(item)
  @options.include?(item)
end


end
