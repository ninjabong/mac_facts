#mac_tmutil_dest.rb
Facter.add(:mac_tmutil_dest) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/bin/tmutil destinationinfo|egrep 'Mount|URL'")

    string[16..string.length]

  end
end

