require_relative './dish'
class MenuLoader
  def initialize
    @objects = []
  end
  def load(file)
    $/="\n\n"
    File.open(file, "r").each do |object|
      @objects << YAML.load(object)
    end
  end
  def objects
    @objects.dup
  end
end
