###############
#   add more content via inscription ids (and ordinals.com)
#  to run use:
#
#  $ ruby sandbox/download_bestof.rb


require 'ordinals'

ids = [
  # no.0  - image/png, 793 bytes   -  100x100px  (pixelate)
  '6fb976ab49dcec017f1e201e84395983204ae1a7c2abf7ced0a85d692e442799i0',
  # no.1  - image/png, 20266 bytes  - 274x310px
  '26482871f33f1051f450f2da9af275794c0b5f1c61ebf35e4467fb42c2813403i0',
]

###
# make unique - why? why not?
puts "  #{ids.size} inscribe(s) - total"
ids = ids.uniq
puts "  #{ids.size} inscribe(s) - unique"



ids.each do |id|

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
end



puts "bye"
