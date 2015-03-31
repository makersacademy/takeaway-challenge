class Restaurant
  attr_reader :dishes
  def initialize
    @dishes = {}
  end

  def load_dishes(filepath)
    File.open(filepath) do |file|
      file.each do |line|
        key, value = line.chomp.split(",")
        @dishes[key] = value.to_f
      end
    end
  end
end
