#mac_tmutil_hours_elapsed.rb
require 'time'
Facter.add(:mac_tmutil_hours_elapsed) do
  confine :kernel => "Darwin"
  setcode do
    osver = Facter.value("macosx_productversion_major")
    if osver == "10.8"
      string = Facter::Util::Resolution.exec("/usr/bin/defaults read /Library/Preferences/com.apple.TimeMachine.plist Destinations | grep BACKUP_COMPLETED_DATE")
      output = string[35..-3]
    elsif osver == "10.9" or "10.10"
      string = Facter::Util::Resolution.exec("/usr/bin/defaults read /Library/Preferences/com.apple.TimeMachine.plist Destinations | egrep -B 2 ');' | tail -n2 | head -n1")
      output = string[13..-2]
    else
      output = "Unsupported OS version"
    end
    if output != "Unsupported OS version"
      t1 = Time.now
      t2 = Time.parse(output)
      output = (((t1.to_i - t2.to_i) / 60) / 60 )
    end
    output
  end
end

