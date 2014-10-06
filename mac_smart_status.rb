#mac_smart_status.rb
Facter.add(:mac_smart_status) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/diskutil info disk0|grep SMART")
    string[29..string.length]
  end
end

