###############
#   generate recursive ordinal punks image via collectio inscriptios.json datasets
#  to run use:
#
#  $ ruby sandbox/ordinalpunks.rb


require 'ordinals'


data = read_json( "./tmp/ordinalpunks.json" )
puts "  #{data['items'].size} inscribe(s)"


composite = RecursiveImageComposite.new( 10, 10, width: 96,
                                                 height: 96 )


data['items'].each_with_index do |rec,i|
   puts "==> #{rec['name']}..."

   id      = rec['inscription_id']
   comment = rec['name'] 

   composite << [id, {pixelate: true,
                      comment:  comment}]
end

buf = composite.to_svg
puts buf

write_text( "./ordinalpunks.svg", buf )

puts "bye"
