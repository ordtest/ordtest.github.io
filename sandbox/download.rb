###############
#   add more content via inscription ids (and ordinals.com)
#  to run use:
#
#  $ ruby sandbox/download.rb


require 'ordinals'


sandbox = Ordinals::Sandbox.new( './content' )

sandbox.add_csv( './sandbox/inscriptions.csv' )

## sandbox.add_collection( "./tmp/ordinalpunks.json" )



puts "bye"
