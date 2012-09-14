require "itunes_csv/version"
require "itunes/library"
require "csv"

module ItunesCsv
  DefaultPath = "~/Music/iTunes/iTunes Music Library.xml"
  class CommandLine
    def self.invoke(args)
      library_path = args.first || File.expand_path(DefaultPath)
      library = ITunes::Library.load(library_path)
      csv_string = CSV.generate do |csv|
      	library.music.tracks.each do |t|
  		    csv << [t.name]
  		  end
  	  end
  	  puts csv_string
    end
  end
end
