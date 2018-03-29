require './wrapper'
require 'commonmarker'

class CommonmarkerWrapper < Wrapper
  def initialize
    @renderer = TaskListRenderer.new(options: :SOURCEPOS)
  end

  def render_html(markdown)
    doc = CommonMarker.render_doc(markdown, :DEFAULT)
    renderer.render(doc)
  end

  class TaskListRenderer < CommonMarker::HtmlRenderer
    def initialize(options: :DEFAULT, extensions: [])
      super
      @task_list_item_id = 0
    end

    def list_item(node)
      check_box_tag = if node.first_child.first_child.string_content.match(/\A\[[x ]?\] /)
        @task_list_item_id += 1
        "<input type='checkbox' data-pos=#{sourcepos(node)} data-task-key=#{@task_list_item_id}>"
      end

      block do
        container("<li#{sourcepos(node)}>#{check_box_tag}", '</li>') do
          out(:children)
        end
      end
    end

    def text(node)
      if node.parent.parent.type === :list_item && m = node.string_content.match(/\A\[[x ]?\] /)
        node.string_content = m.post_match
      end

      out(escape_html(node.string_content))
    end
  end
end
