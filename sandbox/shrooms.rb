####################
#  to run use:
#
#  $ ruby sandbox/shrooms.rb


require 'ordinals'


recs = read_csv( "./sandbox/shrooms_inscriptions.csv" )
puts "  #{recs.size} inscribe(s)"


composite = RecursiveImageComposite.new( 20, 11, width:  100,
                                                 height: 100 )


recs.each do |rec|
   num = rec['num'].to_i(10)
   id  = rec['id']
   puts "==> shroom #{num} @ #{id}..."

   comment = "shroom no. #{num}" 

   composite << [id, {pixelate: true,
                      comment:  comment}]
end

buf = composite.to_svg
puts buf

write_text( "./shrooms.svg", buf )

puts "bye"
