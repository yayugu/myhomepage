require 'yaml'
require './generator'
task :default => :generate

task :generate do
  g = Generator.new
  src = FileList['src/*.txt']
  src.each do |filename|
    yaml = "#{filename}.yml"
    date = 
      if File.exist?(yaml) 
        YAML.load(File.read(yaml))[0]
      else
        date = DateTime.now
        File.write(yaml, [date].to_yaml)
        date
      end
    url = File.basename(filename, ".txt") + '.html'
    html = g.article(File.read(filename), date, url)
    open("./public/articles/#{url}", 'w').write(html)
  end
  File.write('public/index.atom', g.feed)
  File.write('public/index.html', g.top)
  puts "Generatied."
end
