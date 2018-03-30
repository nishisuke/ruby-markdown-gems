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
      check_box_tag = if m = node.first_child.first_child.string_content.match(/\A\[[x ]?\] /)
        node.first_child.first_child.string_content = m.post_match
        @task_list_item_id += 1
        "<input type='checkbox' data-pos=#{sourcepos(node)} data-task-key=#{@task_list_item_id}>"
      end

      block do
        container("<li#{sourcepos(node)}>#{check_box_tag}", '</li>') do
          out(:children)
        end
      end
    end
  end
end
