require 'cocos'

require_relative 'recursive' 

specs = [
   '87 6 25 41 74 59',
   '87 6 25 41 74',
   '87 6 25 41',
   '84 13 68 33 73',
   '87 12 21 38 46 73',
   '84 14 66 35 73',
   '84 11 35 69 72',
   '84 1 44 73 40',
   '87 3 40 43 73',
   '87 83 77',
]

puts "  #{specs.size} mint(s)"



specs.each_with_index do |spec,i|
    g = spec.split( /[ ]/ ).map { |str| str.to_i(10) }
    puts "==> #{i} - g: #{g.inspect}"

    img = RecursiveImage.new( 24, 24 )
    g.each do |num|
        ## d.i.y. maxi biz (punks) spritesheet inscribe id - 240x216 (10x9 grid - 24x24px)
        img << ['ad56d4f242677ac334844002f1c27b9b636ba71f68590cdc0cc5a2cbce080990i0', 
                  {spritesheet: [240,216], 
                   num: num,
                   pixelate: true,}]
    end
 
    buf = img.to_svg
    puts buf

    write_text( "./diymaxibiz#{i}.svg", buf )
end

puts "bye"
