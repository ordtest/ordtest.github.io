###############
#   generate best of sub1k recursive  image via ordinals.com
#  to run use:
#
#  $ ruby sandbox/bestofsub1k.rb


require 'ordinals'
require 'cocos'


inscribes = [
  ['№0  - image/png, 793 bytes  - 100×100px', true,  # pixelate
   '6fb976ab49dcec017f1e201e84395983204ae1a7c2abf7ced0a85d692e442799i0'],
  ['№1  - image/png, 20266 bytes - 274×310px', false,
   '26482871f33f1051f450f2da9af275794c0b5f1c61ebf35e4467fb42c2813403i0'],
  ['№2  - image/gif, 9371 bytes  - 128×128px', false,
   'c17dd02a7f216f4b438ab1a303f518abfc4d4d01dcff8f023cf87c4403cb54cai0'],

  [ '№19 - image/png, 2622 bytes - 256×288px' , true,  # pixelate
   '9163af650dcdeeeb9a7e1f47f693b51921dce3bdf2475e69360ec83d9956f5d7i0'],
  [ '№23 - image/png, 54889 bytes - 960×540px', false,
   '0c107942e4c945b6b44e193c950b0fae65d854a88b450758a3fca54017c879bei0'],
  [ '№26 - image/png, 50848 bytes', false,
    'cfab194b924f7785c6e453728e1c264b89b74843633278cda3ad3f57576c1e93i0'],

  [ '№46 - image/jpeg, 28377 bytes - 609×900px', false,
   'e3e29332b269d0ae3fa28ac80427065d31b75f2c92baa729a3f8de363a0d66f6i0'],
  [ '№48 - image/png, 36832 bytes - 1575×1050px', false,
   '54e47c2f0e75142d1d7a0fe585e81aceb8759b07c6cfe9fa1a0bd6c317eae8b3i0'],

   ['№52 - image/png, 29294 bytes - 594×553px', false,
      'ab2f4e9dce0583264078428a91aa9037da0e75f90dc77fe3cba7cf5320ad003di0'],

   ['№65 - image/jpeg, 111279 bytes', false,
     'ec2127d7ff9dc54c50e70b24f338dc3df7f195331d91aef6bdc4be1814e4669ci0' ],   
  ['№69 - image/png, 21670 bytes  - 415×333px', false,
   'cd55a39d881663508a9340bafb4e860f016f16cb07bf6d34cf40bf5a62adf57bi0'],

  ['№70 - image/jpeg, 51146 bytes  - 600×502px', false, 
   'b1c5baa2593b256068635bbc475e0cc439d66c2dcf12e9de6f3aaeaf96ff818bi0'], 
  ['№71 - image/png, 47633 bytes  - 1697×2400px ', false,
   'e8ce0fcb238b377b3a6b9921333e26fbec5c5724c5bf6e783c3dcc1129794508i0'],

  ['№91 - image/png, 225 bytes  - 24×24px', true, # pixelate
   '87f028facde602fedb65210fb2cee0df3bc8e57323f1b9e7c566cd075170343di0'], 
  ['№99 - image/png, 6727 bytes - 512×512px', true, # pixelate
   '0d495be21c9aeda05a115735dcd8872df052bf54fa382ad39bed0f5efcdb4cfei0'], 
   
  ['№107 - image/webp, 91932 bytes', false,
   '7d33c78c66e3dea3d4ebd6433afc31fcd7bcf3a058d04862ac0e5edc23bbdd80i0'],


  ['№259 - image/jpeg, 25830 bytes', false,
  'ca8c3e5142e721c1b17c00736d1ebe5d82cffef386e1c36c0ef0aefdafc3462fi0'], 
  ['№260 - image/jpeg, 88147 bytes', false,
    'b73bccdc76fee9365ad4c8b1c2351a806d26f594e0f09b7feaba0bd14da49352i0'], 
  ['№285 - image/png, 329047 bytes', false,
   '2759e39184301c0e182f32385d5ee914b2ca2b886c8f9f678d8cc4d193442602i0'], 
  ['№288 - image/jpeg, 373504 bytes', false,
   '8ded644a87f1d771d117b3dc698713e10c35c04965b0ab8353b941f78e336740i0'],  
  ['№293 - image/png, 33901 bytes', false,
   '4b7cc385734612355fd2a085117f8f39c5aee5a80b65554c54d9f9a45551340ei0'],

  ['№378 - image/gif, 375414 bytes', true,  ## pixelate
   '2edd2a1972beafeee32c98ca64ea48d1eccd012963bc4066895d74d35ad40209i0'],

  ['№388 - image/jpeg, 389858 bytes - 2355×1864px', false,
   '23b8c569b78b545c2d565d60f4dbf835c4adb7710d59627ed1bcf451d6b3fef6i0'],

  ['№467 - image/jpeg, 144783 bytes - 1002×1332px', false,
   'e16574cf0cec2edaaa77eff03176a3aee8e8afefa65b3732f03189d0b028f16ei0'],

  ['№573 - image/png, 381 bytes  - 96×96px', true,  # pixelate
   '96d87d7e59d75ebc0e6144b09fdd96355fcdaa86fd098d64c46f19a424012bbei0'],
  ['№586 - image/jpeg, 267930 bytes - 725×1080px', false,
   '462dc9975167210f6ef0edf8b811a42df531e1b82774c3956a9b9d3c79e02365i0'],
  ['№592 - image/png, 538 bytes  - 96×96px', true,  # pixelate
   '5280166f62aa1893666f6d3d5d4e9c0a4b180c59682aae2dbdf84bf45b19030fi0'],

  ['№646 - image/jpeg, 24371 bytes -  1000×1000px', true,  # pixelate
   '1b53b2e2ea3dbe7dd9509c0e1b4e97b2f03dd3acbb7e505d09c142d5387eba83i0'
  ], 
]

puts "  #{inscribes.size} inscribe(s)"


buf =<<TXT
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="100%" height="100%"
  viewBox="0 0 2000 2000">
TXT


inscribes.each_with_index do |(comment, pixelate, id),i|

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

   y,x = i.divmod( 10 ) 

style = pixelate ? %Q[style="image-rendering: pixelated;"] : ''
      

buf += <<TXT 
  <g transform="translate(#{x*200},#{y*200})">
   <!-- #{comment} -->
   <image
     width="200" height="200"
     href="/content/#{id}"
     #{style} />
  </g>
TXT
end


buf += <<TXT
</svg>
TXT


puts buf

write_text( "./bestofsub1k.svg", buf )

puts "bye"
