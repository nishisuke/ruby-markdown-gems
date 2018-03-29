require './wrapper'
require 'redcarpet'

class RedcarpetWrapper < Wrapper
  class TaskListRender < Redcarpet::Render::HTML
    def list_item(text, list_type)
      if m = text.match(/\A\[[x ]?\] /)
        "<li><input type='checkbox'>#{m.post_match}</li>"
      else
        "<li>#{text}</li>"
      end
    end
  end

  def initialize
    @renderer = Redcarpet::Markdown.new(TaskListRender)
  end

  def render_html(markdown)
    renderer.render(markdown)
  end
end
