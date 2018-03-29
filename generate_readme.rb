require './redcarpet_wrapper'
require './commonmarker_wrapper'
require './qiita_wrapper'
require './kramdown_wrapper'
require './rdiscount_wrapper'
require './pipe_wrapper'

markdown = <<~MARKDOWN
  ## Tasks
  - [ ] hoge
  - [x] hoge
  - [ ] hoge
    - [ ] hoge
    - [ ] hoge
      - [ ] hoge
      - [ ] hoge
      - [ ] hoge
  - [ ] hoge
  \t- [ ] hoge
  - [ ] hoge
MARKDOWN

p markdown

File.open('README.html', 'w') do |f|
  f.puts(RedcarpetWrapper.new.render_html("# Redcarpet\n実装済み\n#{markdown}"))
  f.puts(CommonmarkerWrapper.new.render_html("# Commonmarker\n実装済み\n#{markdown}"))
  f.puts(QiitaWrapper.new.render_html("# Qiita\n最初からおk！だけどデフォでdisabled\n#{markdown}"))
  f.puts(KramdownWrapper.new.render_html("# kramdown\n\ncheck_boxするにはopen classしてoverrideしかない\n\nまた改行が二行必要などいけてない\n\n#{markdown}"))
  f.puts(RdiscountWrapper.new.render_html("# Rdiscount\nCの実装に手を出すはめになる\n#{markdown}"))
  f.puts(PipeWrapper.new.render_html("# Pipe\nいける！もともと処理を追加できる設計思想\n#{markdown}"))
end
