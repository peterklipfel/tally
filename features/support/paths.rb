module NavigationHelper
  def path_to(page_name, id=nil)
    case page_name.downcase
    when /home/ then root_path
    when /sign in/ then new_user_session_path
    when /sign up/ then new_user_registration_path
    when /new invoice/ then new_invoice_path
    when /show invoice/ then invoice_path(id)
    when /edit invoice/ then edit_invoice_path(id)
    when /invoices/ then invoices_path
    when /new expense/ then new_expense_path
    when /edit expense/ then edit_expense_path(id)
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