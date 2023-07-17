###############
#   add more content via inscription ids (and ordinals.com)
#  to run use:
#
#  $ ruby sandbox/download.rb


require 'ordinals'

ids = [
  ## recursive punk no.0  - 24x24px
  '7fbfed7e38bbcaf851c2c4426b4c4ede9d09b6e6fd87a040403852681c7c19c2i0',
  '128d1e42f85e67d2a6b0c4c78e9ad47f7d66ed7699e77ddd0a4f0b8a21cdf736i0',
  '62ec589582651e49ed722241dab3bdb93fbd8ddf3fab3d891a30165126dddbcfi0',
  'b866e8f3f51c385a3ae27e65c5abe68e6086a6b74935b1b692de8587f5858148i0',

  ## d.i.y. punks (spritesheet)  - 240x144px  (10x6 grid - 24x24px)
  'cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0',

  ## ordinal punk no. 1 (flow stay)  - 192x192px (8x)
  '8c1ab6c146389d5f4c6d4a5783284ad5e35265e75d27dd6a12a73c2d7260d86ei0',
  '1f7b1e79290091b771b2c78b2b0275efd09c6faf3090d05162a66f491c9f247bi0',

  ## 404 lost files  - 96x96px (4x4 grid - 24x24px)
  'a3fb4ad6ed9654f236a2cb82a101022937c4aecabee4e6b3485e4f0fe26cd855i0',
  '51462e54abfc85be2f813b275ee7ae71f787a771dd14cdd7cf1bf351fa0aa98bi0',
  '1f2fa0155e47da349d964c79561db50af509ae2ce3fc7ee398fab904cba4cca5i0',
  'edb39fd1f0f33b9e989fa32a5a9a2962f806f4cd487f7e30f700014f13ed19aci0',
  '1199a91694b810b8d65270d5826262240d998ef5e295358e919318bd8e65f016i0',
]


ids.each do |id|

   path    = "./content/#{id}"
   if File.exist?( path )
      puts "  in cache"
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
end



puts "bye"
