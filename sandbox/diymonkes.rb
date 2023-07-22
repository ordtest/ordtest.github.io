require 'ordinals'



## single spritesheet
inscribes = [
    ['f685f68aafb1cd897013fb736f24f247848b71f38e425930b462fda39fdca3f8i0', { width: 280, height: 168 }],
]

diymonkes = RecursiveGenerator.new( 28, 28, 
                                      inscribes: inscribes )


{
  '1'  => '54 54',
  '1a' => '57 54 28 52 55',
  '1b' => '56 54 25 34 53',
  '2'  => '7 18 48 52',
  '2a' => ' 58 7 13 45 53',
}.each do |name, spec|
    g = diymonkes._parse( spec )
    puts "==> #{name} - g: #{g.inspect}"

    img = diymonkes.generate( *g )
 
    buf = img.to_svg
    puts buf

    write_text( "./diymonke#{name}.svg", buf )
end

puts "bye"
