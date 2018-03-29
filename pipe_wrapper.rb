require './wrapper'
require 'html/pipeline'

class PipeWrapper < Wrapper
  def initialize
    @renderer = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      # HTML::Pipeline::SyntaxHighlightFilter
      # こんな感じで頑張ってtask list実装！
      # githubのメンテされてないtask filter あり
    ]
  end

  def render_html(markdown)
    renderer.call(markdown)[:output].to_s
  end
end
