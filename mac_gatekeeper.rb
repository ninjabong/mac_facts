#mac_gatekeeper.rb
Facter.add(:mac_gatekeeper) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/spctl --status")
    string
  end
end

