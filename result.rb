require './redcarpet_wrapper'
require './commonmarker_wrapper'
require './qiita_wrapper'
require './kramdown_wrapper'
require './rdiscount_wrapper'
require './pipe_wrapper'

markdown = <<~MARKDOWN
  ## Tasks
  - hoge
  - hoge
  - hoge
  - hoge
  - hoge
  - hoge
MARKDOWN

p markdown

File.open('result.html', 'w') do |f|
  f.puts(CommonmarkerWrapper.new.render_html("# Commonmarker\n実装済み\n#{markdown}"))
end
