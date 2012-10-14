module ApplicationHelper
  def conditional_html(&block)
    lang = I18n.locale
    html = <<-"HTML".gsub( /^\s+/, '' )
      <!--[if lt IE 7 ]>    <html lang="#{lang}" class="ie ie6"> <![endif]-->
      <!--[if IE 7 ]>       <html lang="#{lang}" class="ie ie7"> <![endif]-->
      <!--[if IE 8 ]>       <html lang="#{lang}" class="ie ie8"> <![endif]-->
      <!--[if IE 9 ]>       <html lang="#{lang}" class="ie ie9"> <![endif]-->
      <!--[if (gte IE 9)|!(IE)]><!--> <html lang="#{lang}"> <!--<![endif]-->
      <!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->  
    HTML
    html += capture( &block ) << "\n</html>".html_safe if block_given?
    html.html_safe
  end
  
  def breaking_wrap_wrap(txt, col = 30)
    txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,
      "\\1\\3\n").gsub("\n", '<br/>')
  end
  
  def get_company_page_path
    return page_path(Page.find_or_create_by_title("Company").title)
  end
  
  def get_thinking_page_path
    return page_path(Page.find_or_create_by_title("Thinking").title)
  end  
  
  def get_contact_path
    return page_path(Page.find_or_create_by_title("Contact Us").title)
  end
  
  def get_press_page_path
    return page_path(Page.find_or_create_by_title("Press").title)
  end
  
  def get_people_page_path
    return page_path(Page.find_or_create_by_title("People").title)
  end
end
