#mac_tmutil_last.rb
Facter.add(:mac_tmutil_last) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/bin/tmutil latestbackup")
    # right now
    t1 = Time.new()
    # last backup
#    t2 = Time.new(string[-17..-14], string[-12..-11], string[-9..-8])
    t2 = Time.new(string[-17..-14], string[-12..-11], string[-9..-8], string[-6..-5], string[-4..-3], string[-2..-1])
    # time since last time machine backup

## if there's an error connecting to a network volume it errors back
## "Unable to locate machine directory for host." which we literally
## return as a string for the fact.
    if string == "" then
      string = "Unable to locate machine directory for host."
      string
    else
#      string[-17..-3] # gives us YYYY-MM-DD-HHmm
      string[-17..-8] # gives us YYYY-MM-DD


    end

  end
end

