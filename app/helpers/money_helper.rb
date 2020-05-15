module MoneyHelper
  def round(amount)
    '%.2f' % amount.to_f
  end
end
