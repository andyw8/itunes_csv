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

        options[:output] = nil
        opts.on( '-o', '--output FILE', "Output to FILE instead of stdout" ) do |file|
          options[:output] = file
        end
      end

      opts.parse!(args)

      library_path = File.expand_path(options[:path])
      library = ITunes::Library.load(library_path)
      
      total_tracks = library.music.tracks.count
      puts "Processing #{total_tracks} tracks..."
      
      csv_string = CSV.generate do |csv|
        csv << options[:fields]
        library.music.tracks.each_with_index do |t, index|
          row = options[:fields].map do |f|
            unless t.respond_to?(f.to_sym)
              puts "Unknown field: #{f}"
              exit
            end
            t.send(f.to_sym)
          end
          csv << row
          
          # Print progress every 100 tracks
          if (index + 1) % 100 == 0
            puts "Processed #{index + 1}/#{total_tracks} tracks..."
          end
        end
      end
      
      puts "Completed processing #{total_tracks} tracks."
      
      if options[:output]
        File.write(options[:output], csv_string)
        puts "CSV written to #{options[:output]}"
      else
        puts csv_string
      end
    end
  end
end