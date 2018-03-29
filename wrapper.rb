class Wrapper
  attr_reader :renderer

  def render_html(markdown)
    raise NotImplementedError
  end
end
