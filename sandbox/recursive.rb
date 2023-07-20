
###
# helpers for recursive images (in .SVG)



class RecursiveImage
end # class RecursiveImage

class RecursiveImageComposite
  def initialize( cols, rows, 
                  width: 100, height: 100 )
     @tile_cols = cols
     @tile_rows = rows
 
     @tile_width  = width
     @tile_height = height

     @tiles = []
  end


  def count() @tiles.size; end
  alias_method :size, :count   ## add size alias (confusing if starting with 0?) - why? why not?
  alias_method :tile_count, :count

  def tile_width() @tile_width; end
  def tile_height() @tile_height; end
  def width() @tile_width*@tile_cols; end
  def height() @tile_height*@tile_rows; end

  def add( obj ) @tiles << obj; end
  alias_method :<<, :add

  def to_svg 
buf =<<TXT
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="100%" height="100%"
  viewBox="0 0 #{width} #{height}">
TXT

@tiles.each_with_index do |tile,i|
    y,x = i.divmod( @tile_cols ) 

    id, opts =  tile.is_a?( Array )? tile : [tile, {}]

    pixelate = opts.has_key?(:pixelate) ? opts[:pixelate]
                                        : false
    comment  = opts.has_key?(:comment) ? opts[:comment]
                                       : "№#{i} @ (#{x}/#{y})"
                            
    
    style = pixelate ? %Q[style="image-rendering: pixelated;"] : ''

buf += <<TXT 
  <g transform="translate(#{x*@tile_width},#{y*@tile_height})">
   <!-- #{comment} -->
   <image
     width="#{@tile_width}" height="#{@tile_height}"
     href="/content/#{id}"
     #{style} />
  </g>
TXT

end


buf += <<TXT
</svg>
TXT

    buf
  end
end # class RecursiveImageComposite


## add conveniecen shortcuts/alias - why? why not?
RcsvImage          = RecursiveImage
RcsvImageComposite = RecursiveImageComposite