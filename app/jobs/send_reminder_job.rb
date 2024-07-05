class SendReminderJob < ApplicationJob
  queue_as :default

  def perform(task)
    TaskMailer.deadline_reminder(task).deliver_now if task.status != 'Done'
  end
end
