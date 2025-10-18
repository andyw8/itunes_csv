# iTunes CSV

Export iTunes Library XML data to CSV

# Why?

I wanted to do a clean-up of my library. iTunes allows you to copy and paste from iTunes into a spreadsheet, but this only includes visible columns. For non-visible columns such as location you need to parse the XML.

## Installation

    $ gem install itunes_csv

## Usage

    $ itunes_csv --help
    Usage: itunes_csv [options]
        -f, --fields name,track,year     List of fields (default: name,artist)
        -p, --path PATH                  Path to iTunes XML file (default: ~/Music/iTunes/iTunes Music Library.xml)
        -o, --output file                File to export the CSV file to (default: print to stdout)

## Notes

May take a long time to run for a large iTunes library (10,000+ tracks)

Supported fields are pulled from itunes-library track.rb file and include:

 * album
 * artist
 * date_added
 * genre
 * id
 * kind
 * last_played_at
 * location
 * persistent_id
 * play_count
 * comment
 * duration_ms
 * rating

and others!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
