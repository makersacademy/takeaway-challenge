class Menu

  attr_reader :content

  def initialize
    @content = {"Fish and chips" => 7, "Steak and chips" => 10,
                "Shepherd's Pie" => 5, "Bangers and mash" => 5}
  end

  def read
    @content.each {|k, v| puts k.ljust(20) + v.to_s.rjust(2)}
  end

end
