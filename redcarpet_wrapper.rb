require './wrapper'
require 'redcarpet'

class RedcarpetWrapper < Wrapper
  class TaskListRender < Redcarpet::Render::HTML
    attr_accessor :count

    def list_item(text, list_type)
      self.count ||= 0
      self.count += 1
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
