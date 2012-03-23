# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'gitpusher' do
  watch(/(.*)/) {|m| `git add -u;git add -A;git commit -m "auto upload by gitpusher";git push` } 
  watch(%r{^src/*.txt$}) { `rake` }
end
