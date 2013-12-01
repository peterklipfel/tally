Given(/^the following payments exist:$/) do |table|
  table.hashes.each do |attrs|
    Payment.create!(attrs)
  end
end
