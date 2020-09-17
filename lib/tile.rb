class Tile
  @@DEFAULT = " "

  def DEFAULT
    return @@DEFAULT
  end

  def initialize(content=nil)
    @content = content
  end

  def set_content(content)
    if @content.nil?
      @content = content
      true
    else
      false
    end
  end

  def content
    return @content || @@DEFAULT
  end
end