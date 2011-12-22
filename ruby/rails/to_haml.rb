class ToHaml
  def initialize(path)
    @path = path
  end
  
  def convert!
    Dir["#{@path}/**/*.erb"].each do |file|
      `html2haml -r #{file} #{file.gsub(/\.erb$/, '.haml')}`
      `rm #{file}`
      `mv #{file.gsub(/\.erb$/, '.haml')} #{file}`
      `git mv #{file} #{file.gsub(/\.erb$/, '.haml')}`
    end
  end
end

path = File.join(File.dirname(__FILE__), 'app', 'views')
ToHaml.new(path).convert!
