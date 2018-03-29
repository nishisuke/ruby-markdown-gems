require './wrapper'
require 'qiita-markdown'

class QiitaWrapper < Wrapper
  def initialize
    @renderer = Qiita::Markdown::Processor.new(hostname: 'example.com') # aタグの外部リンク判定のために必須オプション
  end

  def render_html(markdown)
    renderer.call(markdown)[:output].to_s
  end
end
