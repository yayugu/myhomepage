# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'gitpusher' do
  watch(%r{^src/.*\.txt$}) {|m| `git add -u;git add -A;git commit -m "auto upload by gitpusher";git push;rake` } 
end
