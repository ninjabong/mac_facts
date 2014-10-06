#mac_sshd_status.rb
Facter.add(:mac_sshd_status) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/systemsetup getremotelogin")
    string[14..string.length]
  end
end

