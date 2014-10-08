#mac_tmutil_last.rb
Facter.add(:mac_tmutil_last) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("defaults read /Library/Preferences/com.apple.TimeMachine.plist Destinations | grep BACKUP_COMPLETED_DATE")
    string[35..-3]
  end
end

