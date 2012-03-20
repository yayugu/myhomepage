# encoding: utf-8

require 'erubis'

class Generator
  Article = Struct.new("Article", :title, :body, :updated, :url)
  def initialize
    @template = Erubis::Eruby.new(File.read('article.erb'))
    @base_url = "http://moji.yayugu.net"
    @blog_title = "更に新しいyayuguのBlog"
    @articles = []
  end

  def article(text, date, url)
    lines = text.chomp.split("\n")
    h1 = lines.shift
    title = "#{h1} -- #{@blog_title}"
    body = lines.join("<br />\n")
    @articles.push Article.new(h1, body, date, url)

    @template.result(binding())
  end

  def feed
    @articles.sort_by!{|a| a.updated }.reverse!
    last_updated = @articles[0].updated
    Erubis::Eruby.new(File.read('feed.erb')).result(binding())
  end

  def top
    Erubis::Eruby.new(File.read('top.erb')).result(binding())
  end
end
