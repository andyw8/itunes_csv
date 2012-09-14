require "itunes_csv/version"
require "itunes/library"
require "csv"
require 'optparse'

module ItunesCsv
  class CommandLine
    def self.invoke(args)
      options = {}

      opts = OptionParser.new do |opts|
        options[:fields] = ['name', 'artist']
        opts.on( '-f', '--fields a,b,c', Array, "List of fields (default: #{options[:fields].join(',')})" ) do |list|
          options[:fields] = list
        end

        options[:path] = '~/Music/iTunes/iTunes Music Library.xml'
        opts.on( '-p', '--path PATH', "Path to iTunes XML file (default: #{options[:path]})" ) do |path|
          options[:path] = path
        end
      end

      opts.parse!

      library_path = File.expand_path(options[:path])
      library = ITunes::Library.load(library_path)
      csv_string = CSV.generate do |csv|
        csv << options[:fields]
      	library.music.tracks.each do |t|
          row = options[:fields].map do |f|
            unless t.respond_to?(f.to_sym)
              puts "Unknown field: #{f}"
              exit
            end
            t.send(f.to_sym)
          end
  		    csv << row
  		  end
  	  end
  	  puts csv_string
    end
  end
end
