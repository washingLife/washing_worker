module ApplicationHelper
  def is_active?(expected_value, actual_value)
    expected_value == actual_value ? 'active' : ''
  end

  def qiniu_url(url)
    "http://oy9sjtexs.bkt.clouddn.com/#{url}"
  end
end
