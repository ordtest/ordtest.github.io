###############
#   generate best of sub1k recursive  image via ordinals.com
#  to run use:
#
#  $ ruby sandbox/bestofsub1k.rb


require 'ordinals'
require 'cocos'


inscribes = [
  ['№0  - image/png, 793 bytes  - 100×100px', true,  # pixelate
   '6fb976ab49dcec017f1e201e84395983204ae1a7c2abf7ced0a85d692e442799i0'],
  ['№1  - image/png, 20266 bytes - 274×310px', false,
   '26482871f33f1051f450f2da9af275794c0b5f1c61ebf35e4467fb42c2813403i0'],
  ['№2  - image/gif, 9371 bytes  - 128×128px', false,
   'c17dd02a7f216f4b438ab1a303f518abfc4d4d01dcff8f023cf87c4403cb54cai0'],


  ['№70 - image/jpeg, 51146 bytes  - 600×502px', false, 
   'b1c5baa2593b256068635bbc475e0cc439d66c2dcf12e9de6f3aaeaf96ff818bi0'], 
  ['№71 - image/png, 47633 bytes  - 1697×2400px ', false,
   'e8ce0fcb238b377b3a6b9921333e26fbec5c5724c5bf6e783c3dcc1129794508i0'],

  ['№91 - image/png, 225 bytes  - 24×24px', true, # pixelate
   '87f028facde602fedb65210fb2cee0df3bc8e57323f1b9e7c566cd075170343di0'], 
  ['№99 - image/png, 6727 bytes - 512×512px', true, # pixelate
   '0d495be21c9aeda05a115735dcd8872df052bf54fa382ad39bed0f5efcdb4cfei0'], 
   
  ['№573 - image/png, 381 bytes  - 96×96px', true,  # pixelate
   '96d87d7e59d75ebc0e6144b09fdd96355fcdaa86fd098d64c46f19a424012bbei0'], 
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

write_text( "./bestofsub1k.svg", buf )

puts "bye"
