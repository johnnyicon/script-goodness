# Adapted the script listed in the following link to maintain git history
# Original Script: http://snippets.dzone.com/posts/show/5449
# Usage:
#  1) Copy the file to the root of your Rails app
#  2) Run the script (i.e., ruby to_haml.rb app/views)
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
