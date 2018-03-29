require './redcarpet_wrapper'
require './commonmarker_wrapper'
require './qiita_wrapper'
require './kramdown_wrapper'
require './rdiscount_wrapper'
require './pipe_wrapper'

markdown = <<~MARKDOWN
  - hoge
  - hoge
  - hoge

  ## Tasks
  - [ ] hoge
  - [x] hoge
  - [ ] hoge
    - [ ] hoge
    - [ ] hoge
  - [ ] hoge
  \t- [ ] hoge
  - [ ] hoge
MARKDOWN

p markdown

File.open('markdown.html', 'w') do |f|
  f.puts(RedcarpetWrapper.new.render_html("# Redcarpet\n#{markdown}"))
  f.puts(CommonmarkerWrapper.new.render_html("# Commonmarker\n#{markdown}"))
  f.puts(QiitaWrapper.new.render_html("# Qiita\n#{markdown}"))
  f.puts(KramdownWrapper.new.render_html("# kramdown\n#{markdown}"))
  f.puts(RdiscountWrapper.new.render_html("# Rdiscount\n#{markdown}"))
  f.puts(PipeWrapper.new.render_html("# Pipe\n#{markdown}"))
end
