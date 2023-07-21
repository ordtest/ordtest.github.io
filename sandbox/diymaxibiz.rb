require 'ordinals'


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


## single spritesheet
inscribes = [
    ['ad56d4f242677ac334844002f1c27b9b636ba71f68590cdc0cc5a2cbce080990i0', { width: 240, height: 216 }],
]

diymaxibiz = RecursiveGenerator.new( 24, 24, 
                                      inscribes: inscribes )


specs.each_with_index do |spec,i|
    g = diymaxibiz._parse( spec )
    puts "==> #{i} - g: #{g.inspect}"

    img = diymaxibiz.generate( *g )
 
    buf = img.to_svg
    puts buf

    write_text( "./diymaxibiz#{i}.svg", buf )
end

puts "bye"
