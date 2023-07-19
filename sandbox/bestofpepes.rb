###############
#   generate best of pepes (sub1k) recursive  image via ordinals.com
#  to run use:
#
#  $ ruby sandbox/bestofpepes.rb


require 'ordinals'
require 'cocos'


inscribes = [
  ['№9 - image/webp, 34140 bytes', false,
   'a4b5580db345db7534b74371f40562ba0d6f79fd272e05c62c05db1b62996d23i0'],
  ['№10 - image/webp, 103516 bytes', false,
   '7641ef7165bc59c40b269d4b2f6741ca3f34334b8c758fbba155bd0e29b4011bi0'],
  ['№11 - image/webp, 49628 bytes', false,
   '7460a1068f98e1fac798304addca4b5eed1cc9968cd5526e07c2ceb3ec7cf7b3i0'],
]

puts "  #{inscribes.size} inscribe(s)"


buf =<<TXT
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="100%" height="100%"
  viewBox="0 0 1000 1000">
TXT


inscribes.each_with_index do |(comment, pixelate, id),i|

   path    = "./content/#{id}"
   if File.exist?( path )
      ## puts "  in cache"
   else
      ## note: save text as blob - byte-by-byte as is  (might be corrupt text)

      content = Ordinals.content( id )
      pp content
      #=> #<Ordinals::Api::Content:0x000001a1352df938
      #      @data="RIFF\xF8\v\x00\x00WEBPVP8 \xEC\v\x00\x00...",
      #      @length=3072,
      #      @type="image/png"

      puts "data:"
      puts content.data

      write_blob( path, content.data )

      sleep( 0.5 )
   end

   y,x = i.divmod( 10 ) 

style = pixelate ? %Q[style="image-rendering: pixelated;"] : ''
      

buf += <<TXT 
  <g transform="translate(#{x*100},#{y*100})">
   <!-- #{comment} -->
   <image
     width="100" height="100"
     href="/content/#{id}"
     #{style} />
  </g>
TXT
end


buf += <<TXT
</svg>
TXT


puts buf

write_text( "./bestofpepes.svg", buf )

puts "bye"
