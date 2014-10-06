#mac_sshd.rb
Facter.add(:mac_sshd) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/systemsetup getremotelogin")
    string
  end
end

