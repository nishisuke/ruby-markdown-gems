require './wrapper'
  require 'rdiscount'

class RdiscountWrapper < Wrapper
  # checkbox やるにはc実装が必要
  def render_html(markdown)
    markdown = RDiscount.new(markdown).to_html
  end
end
