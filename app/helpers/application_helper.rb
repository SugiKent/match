module ApplicationHelper
  def date_format(datetime)
  y = datetime.year.to_s
  m = datetime.month.to_s
  d = datetime.day.to_s
  return "#{y}年#{m}月#{d}日"


end
end
