require 'cocos'

require_relative 'recursive' 


## add first nine base types
##  with bitcoin pattern background
##   in 3x3 grid composite


specs = [
  [59,0],  
  [59,1],  
  [59,2],  
  [59,3],  
  [59,4],  
  [59,5],  
  [59,6],  
  [59,7],  
  [59,8],  
]



composite = RecursiveImageComposite.new( 3, 3, width: 24,
                                               height: 24)


specs.each_with_index do |g,i|
    puts "==> #{i} - #{g.inspect}"

    rcsv = RecursiveImage.new( 24, 24 )
    g.each do |num|
        ## d.i.y. punks spritesheet inscribe id - 240x144 (10x6 grid - 24x24px)
        rcsv << ['cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0', 
                  {spritesheet: [240,144], 
                   num: num,
                   pixelate: true,}]
     end
     puts rcsv.to_svg

     composite << rcsv
end



buf = composite.to_svg
puts buf

write_text( "./diypunks.svg", buf )

puts "bye"

