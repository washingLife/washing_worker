module OrdersHelper
  def show_order_courier_status(status)
    case status
    when 'wuliu_qu_paidan'
      '物流取派单'
    when 'wuliu_qu_jiedan'
      '物流取接单'
    when 'wuliu_qu_qianshou'
      '物流取签收'
	end
  end
end