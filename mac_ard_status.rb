#mac_ard_status.rb
Facter.add(:mac_ard_status) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("ps ax | grep -v grep | grep ARDAgent")
    if string.empty? == false
      ard = "enabled"
    else
      ard = "disabled"
    end
    ard
  end
end

