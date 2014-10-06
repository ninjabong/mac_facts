#mac_ntp_status.rb
Facter.add(:mac_ntp_status) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/systemsetup -getusingnetworktime")
    unless string == "Network Time: On" then
      output = string[14..string.length]
    else
      string2 = Facter::Util::Resolution.exec("/usr/sbin/systemsetup -getnetworktimeserver")
      output = string[14..string.length] + " - " + string2[21..string2.length]
    end
    output
  end
end

