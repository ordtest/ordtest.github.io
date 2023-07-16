###############
#   add more content via inscription ids (and ordinals.com)
#  to run use:
#
#  $ ruby sandbox/download.rb


require 'ordinals'

ids = [
  ## recursive punk no.0
  '7fbfed7e38bbcaf851c2c4426b4c4ede9d09b6e6fd87a040403852681c7c19c2i0',
  '128d1e42f85e67d2a6b0c4c78e9ad47f7d66ed7699e77ddd0a4f0b8a21cdf736i0',
  '62ec589582651e49ed722241dab3bdb93fbd8ddf3fab3d891a30165126dddbcfi0',
  'b866e8f3f51c385a3ae27e65c5abe68e6086a6b74935b1b692de8587f5858148i0',

  ## d.i.y. punks (spritesheet)
  'cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0',
]


ids.each do |id|

   path    = "./content/#{id}"
   if File.exist?( path )
      puts "  in cache"
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
