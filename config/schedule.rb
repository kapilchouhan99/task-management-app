every 1.day, at: '6:00 am' do
  Task.where('deadline > ? AND deadline < ?', Time.now, 1.day.from_now).find_each do |task|
    SendReminderJob.perform_later(task)
  end
end

every 1.hour do
  Task.where('deadline > ? AND deadline < ?', Time.now, 1.hour.from_now).find_each do |task|
    SendReminderJob.perform_later(task)
  end
end
