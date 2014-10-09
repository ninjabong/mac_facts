#mac_tmutil_last.rb
Facter.add(:mac_tmutil_last) do
  confine :kernel => "Darwin"
  setcode do
    osver = Facter.value("macosx_productversion_major")
    if osver == "10.8"
      string = Facter::Util::Resolution.exec("/usr/bin/defaults read /Library/Preferences/com.apple.TimeMachine.plist Destinations | grep BACKUP_COMPLETED_DATE")
      string[35..-3]
    elsif osver == "10.9" or "10.10"
      string = Facter::Util::Resolution.exec("/usr/bin/defaults read /Library/Preferences/com.apple.TimeMachine.plist Destinations | egrep -B 2 ');' | tail -n2 | head -n1")
      string[13..-2]
    else
      string = "not supported"
      string
    end
  end
end

