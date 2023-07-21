require 'ordinals'


## add first nine base types
##  with bitcoin pattern background
##   in 3x3 grid composite


## single spritesheet
inscribes = [
    ['cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0', { width: 240, height: 144 }],
]

diypunks = RecursiveGenerator.new( 24, 24, 
                                    inscribes: inscribes )


composite = RecursiveImageComposite.new( 3, 3, width: 24,
                                               height: 24)


[
  '59 0',  
  '59 1',  
  '59 2',  
  '59 3',  
  '59 4',  
  '59 5',  
  '59 6',  
  '59 7',  
  '59 8',  
].each_with_index do |spec,i|
    g = diypunks._parse( spec )
    puts "==> #{i} - #{g.inspect}"

    img = diypunks.generate( *g )
    puts img.to_svg

    composite << img
end



buf = composite.to_svg
puts buf

write_text( "./diypunks.svg", buf )

puts "bye"

