# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'gitpusher' do
  watch(%r{^src/.*\.txt$}) do |m|
    `
      bundle exec rake;
      git add -u;git add -A;git commit -m "auto upload by gitpusher";git push;
    `
  end
end
