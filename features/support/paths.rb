module NavigationHelper
  def path_to(page_name, item=nil)
    case page_name.downcase
    when /home/ then root_path
    when /sign in/ then new_user_session_path
    when /sign up/ then new_user_registration_path
    when /new invoice/ then new_invoice_path
    when /show invoice/ then invoice_path(item)
    when /edit invoice/ then edit_invoice_path(item)
    when /invoices/ then invoices_path
    when /new expense/ then new_invoice_expense_path(item)
    when /edit expense/ then edit_invoice_expense_path(item.invoice, item)
    when /edit client/ then edit_client_path(item)
    when /new client/ then new_client_path
    when /clients/ then clients_path
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
    
  end
end