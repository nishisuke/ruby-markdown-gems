require './wrapper'
require 'kramdown'

class KramdownWrapper < Wrapper
  # checkboxやるにはopen classしてmethodoverride！！
  # クソ仕様！！
  def render_html(markdown)
    Kramdown::Document.new(markdown).to_html
  end
end

