####################
#  to run use:
#
#  $ ruby sandbox/shadowhats.rb


require 'ordinals'


recs = read_csv( "./sandbox/shadowhats_inscriptions.csv" )
puts "  #{recs.size} inscribe(s)"

composite = RecursiveImageComposite.new( 5, 2,   width:  100,
                                                 height: 100 )


recs.each do |rec|
   title = rec['title']
   id   = rec['id']
   puts "==> #{title} @ #{id}..."

   comment = title 

   composite << [id, {pixelate: true,
                      comment:  comment}]
end

buf = composite.to_svg
puts buf

write_text( "./shadowhats.svg", buf )

puts "bye"
