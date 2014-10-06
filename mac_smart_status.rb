#mac_smart_status.rb
Facter.add(:mac_smart_status) do
  confine :kernel => "Darwin"
  setcode do
    command = "/usr/sbin/diskutil info " + Facter.value(:sp_boot_volume) + "|grep SMART"
    string = Facter::Util::Resolution.exec(command)
    string[29..string.length]
  end
end

