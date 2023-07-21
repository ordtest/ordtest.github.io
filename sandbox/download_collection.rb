###############
#   add more content via collectio inscriptios.json datasets (and ordinals.com)
#  to run use:
#
#  $ ruby sandbox/download_collection.rb


require 'ordinals'



data = read_json( "./tmp/ordinalpunks.json" )
puts "  #{data['items'].size} inscribe(s)"



data['items'].each do |rec|
   puts "==> #{rec['name']}..."

   id = rec['inscription_id']

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
