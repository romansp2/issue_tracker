class IssueTrackerHookListener < Redmine::Hook::Listener
  Time.zone = ActiveSupport::TimeZone.new('Europe/Kiev') #Часовой пояс ,в котором будет отправляться время
  require 'send_post'
  include SendPost
  def controller_issues_edit_after_save(context = { })

    data={:issueid=>context[:issue].id, :userid=>User.current[:id],
          :datatime=>context[:issue].updated_on.in_time_zone.strftime "%Y-%d-%m %H:%M:%S"}
    post(data)
  end
  def controller_journals_edit_post(context = { })

    logger.warn()
    logger.warn(User.current[:id])
    data={:issueid=>context[:journal].journalized_id, :userid=>User.current[:id],
          :datatime=>context[:issue].created_on.in_time_zone.strftime "%Y-%d-%m %H:%M:%S"}
    post(data)
  end
end