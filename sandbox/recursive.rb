
###
# helpers for recursive images (in .SVG)


class RecursiveImage
  def initialize( width, height )
     @width  = width
     @height = height 

     @recursions = []
  end

  def add( obj ) @recursions << obj; end
  alias_method :<<, :add

  def count() @recursions.size; end
  alias_method :size, :count   ## add size alias (confusing if starting with 0?) - why? why not?
 
  def width() @width; end
  def height() @height; end


  def to_svg( format=:standalone )
       buf = ''
     
  if [:standalone].include?( format.downcase.to_sym )
        buf +=<<TXT
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="100%" height="100%"
  viewBox="0 0 #{width} #{height}">
TXT
  else  ## assume :inline/:embed or such
      ## todo/check:  add px e.g. 100 => 100px - why? why not?
       buf +=<<TXT
  <svg width="#{width}" height="#{height}">
TXT
    end

@recursions.each_with_index do |recursion,i|
    id, opts =  recursion.is_a?( Array )? recursion : [recursion, {}]

    pixelate = opts.has_key?(:pixelate) ? opts[:pixelate]
                                        : false
                               
    style = pixelate ? %Q[style="image-rendering: pixelated;"] : ''

    ## note: assumes spritesheet has tile of same size as image itself!!!!
    spritesheet = opts[:spritesheet]
    if spritesheet
        num = opts[:num] || opts[:tile]
        spritesheet_width = spritesheet[0] 
        tile_cols = spritesheet_width/width
        y,x = num.divmod( tile_cols ) 
      
buf += <<TXT 
    <svg viewBox="#{x*width} #{y*height} #{width} #{height}">
      <image href="/content/#{id}"
        #{style} />
    </svg>
TXT
    else
buf += <<TXT 
   <image href="/content/#{id}"
     #{style} />
TXT
    end
end

       buf += <<TXT
</svg>
TXT
      buf
  end # method to_svg
end # class RecursiveImage




class RecursiveImageComposite
  def initialize( cols, rows, 
                  width: 100, height: 100 )
     @tile_cols = cols
     @tile_rows = rows
 
     @tile_width  = width
     @tile_height = height

     @recursions = []
  end


  def count() @recursions.size; end
  alias_method :size, :count   ## add size alias (confusing if starting with 0?) - why? why not?
 
  def tile_width() @tile_width; end
  def tile_height() @tile_height; end
  def width() @tile_width*@tile_cols; end
  def height() @tile_height*@tile_rows; end

  def add( obj ) @recursions << obj; end
  alias_method :<<, :add

  def to_svg 
buf =<<TXT
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="100%" height="100%"
  viewBox="0 0 #{width} #{height}">
TXT

@recursions.each_with_index do |recursion,i|
    y,x = i.divmod( @tile_cols ) 

    if recursion.is_a?( RecursiveImage )
      comment  =  "№#{i} @ (#{x}/#{y})"
buf += <<TXT 
  <g transform="translate(#{x*@tile_width},#{y*@tile_height})">
   <!-- #{comment} -->
   #{recursion.to_svg( :inline )}
  </g>
TXT
    else
      id, opts =  recursion.is_a?( Array )? recursion : [recursion, {}]

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