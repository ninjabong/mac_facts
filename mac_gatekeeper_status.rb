#mac_gatekeeper_status.rb
Facter.add(:mac_gatekeeper_status) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/spctl --status")
    string[12..string.length]
  end
end

