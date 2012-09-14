# iTunes CSV

Export iTunes Library XML data to CSV

## Installation

    $ gem install itunes_csv

## Usage

    $ itunes_csv --help
    Usage: itunes_csv [options]
        -f, --fields name,track,year     List of fields (default: name,artist)
        -p, --path PATH                  Path to iTunes XML file (default: ~/Music/iTunes/iTunes Music Library.xml)

## Notes

May take a long time to run for a large iTunes library (10,000+ tracks)

Supported fields:

 * album
 * artist
 * audio?
 * audiobook?
 * composer
 * date_added
 * episode_number
 * genre
 * id
 * kind
 * last_played_at
 * movie?
 * number
 * persistent_id
 * play_count
 * played?
 * podcast?
 * season_number
 * total_time
 * tv_show?
 * unplayed?
 * video?
 * year

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
