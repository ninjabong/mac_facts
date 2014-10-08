#mac_tmutil_days_elapsed.rb
Facter.add(:mac_tmutil_days_elapsed) do
  confine :kernel => "Darwin"
  setcode do
    backup_time = Facter::Util::Resolution.exec("/usr/bin/tmutil latestbackup")
    t = Time.now()
    current_time = t.strftime("%Y-%m-%d")

    current_year = current_time[0..3].to_i
    backup_year = backup_time[-17..-14].to_i
    elapsed_year = current_year.to_i - backup_year.to_i

    current_month = current_time[5..6].to_i
    backup_month = backup_time[-12..-11].to_i
    elapsed_month = current_month.to_i - backup_month.to_i

    current_day = current_time[8..9].to_i
    backup_day = backup_time[-9..-8].to_i
    elapsed_days = current_day.to_i - backup_day.to_i

    if elapsed_year > 0
      backup_elapsed = elapsed_year * 365 # days
    elsif elapsed_month > 0
      backup_elapsed = elapsed_month * 30 # days
    elsif elapsed_days >= 0
      backup_elapsed = elapsed_days       # days
    end
   backup_elapsed
  end
end

