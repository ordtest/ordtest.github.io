
class RecursiveGenerator
    def initialize( width, height,
                    pixelate: true,
                    inscribes:  )
        @width  = width
        @height = height
        @inscribes = inscribes
        @pixelate  = pixelate
    end

    SEP_RX = %r{[ \t/,;*+_-]+
               }x

    def _parse( str )
        str.strip.split( SEP_RX ).map { |str| str.to_i(10) }
    end

    def generate( *args )
       g = if args.size==1 && args.is_a?( String )
              _parse( args[0] )
           else  ## assume integer numbers
              args
           end
       img = RecursiveImage.new( @width, @height )
       g.each do |num|
          id = @inscribes[num]
          img << [id, {pixelate: @pixelate}]
       end
       img 
    end    
end # class RecursiveGenerator

