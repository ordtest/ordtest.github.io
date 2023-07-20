###############
#   generate best of pepes (sub1k) recursive  image via ordinals.com
#  to run use:
#
#  $ ruby sandbox/bestofpepes.rb


require 'ordinals'
require 'cocos'

require_relative 'recursive'



inscribes = [
  ['№9 - image/webp, 34140 bytes', false,
   'a4b5580db345db7534b74371f40562ba0d6f79fd272e05c62c05db1b62996d23i0'],
  ['№10 - image/webp, 103516 bytes', false,
   '7641ef7165bc59c40b269d4b2f6741ca3f34334b8c758fbba155bd0e29b4011bi0'],
  ['№11 - image/webp, 49628 bytes', false,
   '7460a1068f98e1fac798304addca4b5eed1cc9968cd5526e07c2ceb3ec7cf7b3i0'],

      ['№31 - image/gif, 358367 bytes', false,
       '9d0ad29ef2923df9d598a1a890ead36ebbe44f1f1d77d93efa21325806311f28i0'],
     [ '№33 - image/png, 267901 bytes', false,
       '03a6381c7e224d4fe2425b5f5da3782e8bd5701e783bd0af4ee1e2700dbbb347i0'],
     ['№37 - image/jpeg, 243601 bytes', false,
      '7eccd70601a5a65421f560743f2661116bc88b4d73a72f4199850b498ce8e996i0'],
     ['№39 - image/jpeg, 200742 bytes', false,
      '6b76932bb8f2478fe58d27b9f80c1c6d02ac0083ba34f9f46a2a171e9a385851i0'],
    ['№56 - image/jpeg, 125313 bytes', false,
      '0bd542ec42b205332c4c00739a83c7342bf4f435cafd569eb543b00e62a852fdi0'],
    [ '№57 - image/png, 128015 bytes', false,
     '2999656aa17255cb9944aad1b0853937c0bdbc595120e5a5fa97f622ed302aeci0'],
    ['№72 - image/jpeg, 40910 bytes', false,
     'e562a1ff65f7ea698751c1a503bea6a3f6ddc46be7e61a5323d630921b1e18b3i0'],
    ['№87 - image/webp, 7326 bytes', false,
     'ef73907f9d9274b6f315b9c7ea24ce6b8ac2076b4c66b6dd9192ca33ed2106a6i0'],
    [ '№88 - image/png, 120707 bytes', false,
      'caba951a991cf84f33fc4563c89cc6e8ecb2ec9f99d614a2dde781c6fab24f58i0'],

  [ '№103 - image/jpeg, 59258 bytes', false,
    '4697c3dba8e714e4b07ed2c6fe8071d95428edec1d48caa2a0e288a74a592df3i0'],
  [ '№106 - image/png, 2237 bytes', true,  ## pixelate
    '7702a517dfc0ebd556b8589eb6d74567a7f62188e14c33cb81546f7499101e92i0'], 
  [ '№115 - image/jpeg, 26106 bytes', false,
    '17ce7490a6ba7845608b7184d3a6b5b3e33b3ea8c89ededecfc008aef30b4a0di0'],
  
    
  [ '№270 - image/jpeg, 56988 bytes', false,
    '59fec24325aa66fa9c0f21c0b24c336764fa874bd2dfa6e8e9c680e20e4ea610i0'],  
  [ '№279 - image/jpeg, 127291 bytes', false,
    'bed0edab0901ad1c5354fd8ff51bd8b61ac6108b3ef94680105b8c0a3aeb0917i0'],  
    
]

puts "  #{inscribes.size} inscribe(s)"


composite = RecursiveImageComposite.new( 10, 5, width: 100,
                                                height: 100)

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

   composite << [id, {pixelate: pixelate, 
                      comment:  comment}]
end 


buf = composite.to_svg
puts buf

write_text( "./bestofpepes.svg", buf )

puts "bye"
