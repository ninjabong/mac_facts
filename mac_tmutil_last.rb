#mac_tmutil_last.rb
Facter.add(:mac_tmutil_last) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/bin/tmutil latestbackup")
    if string == "" then
      string = "Unable to locate machine directory for host."
      string
    else
      string[-17..-3] # gives us YYYY-mm-DD-HHMM
    end
  end
end

