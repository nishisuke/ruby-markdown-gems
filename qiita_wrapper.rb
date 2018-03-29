require './wrapper'
require 'qiita-markdown'

class QiitaWrapper < Wrapper
  class Hoge < HTML::Pipeline::Filter
    def call
      hoge = 1
      doc.search("li").each do |li|
        li['class'] = "hoge-#{hoge}"
        hoge += 1
      end
      doc
    end
  end

  def initialize
    @renderer = Qiita::Markdown::Processor.new(hostname: 'example.com') # aタグの外部リンク判定のために必須オプション
    @renderer.filters << Hoge
  end

  def render_html(markdown)
    renderer.call(markdown)[:output].to_s
  end
end
