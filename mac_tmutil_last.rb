#mac_tmutil_last.rb
Facter.add(:mac_tmutil_last) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/bin/tmutil latestbackup")
    ## if there's an error connecting to a network volume it errors back
    ## "Unable to locate machine directory for host." which we literally
    ## return as a string for the fact.
    if string == "" then
      string = "Unable to locate machine directory for host."
      string
    else
#      string[-17..-3] # gives us YYYY-mm-DD-HHMM
      string[-17..-8] # gives us YYYY-mm-DD
    end
  end
end

