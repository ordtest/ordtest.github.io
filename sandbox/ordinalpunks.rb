###############
#   generate recursive ordinal punks image via collectio inscriptios.json datasets
#  to run use:
#
#  $ ruby sandbox/ordinalpunks.rb


require 'cocos'



data = read_json( "./tmp/ordinalpunks.json" )
puts "  #{data['items'].size} inscribe(s)"


buf =<<TXT
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="100%" height="100%"
  viewBox="0 0 960 960">
TXT

data['items'].each_with_index do |rec,i|
   puts "==> #{rec['name']}..."

   id = rec['inscription_id']

   y,x = i.divmod( 10 ) 

buf += <<TXT 
  <g transform="translate(#{x*96},#{y*96})">
   <!-- ordinal punk no. #{i+1} -->
   <image width="96" height="96"
     href="/content/#{id}"
     style="image-rendering: pixelated;" />
  </g>
TXT
end

buf += <<TXT
</svg>
TXT


puts buf

write_text( "./ordinalpunks.svg", buf )

puts "bye"
