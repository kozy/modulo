module Modulo
  include Radiant::Taggable

  
  desc %{
    Modulo root tag, not to be called on its own usually.
  }
  tag "modulo" do |tag|
    if children = tag.locals.children
      tag.locals.index = children.all(children_find_options(tag)).rindex(tag.locals.page)
    else
      raise TagError.new("This tag should only be called from inside <r:children:each /> and the like. ")
    end
    
    attr = tag.attr.symbolize_keys

    if column = attr[:columns]
      if column =~ /^\d{1,2}$/
        tag.locals.columns = column.to_i
      else
        raise TagError.new("columns attribute of 'modulo' tag must be a positive number between 1 and 2 digits")
      end
    end
    
    tag.expand
  end

  desc %{
    The index of the item in the collection. Useful for scripting.
  }
  tag "modulo:index" do |tag|
    tag.locals.index
  end

  desc %{
    Expands only if this is the last column as defined in the modulo columns attribute
  }
  tag "modulo:if_last_column" do |tag|
    if tag.locals.columns
      tag.expand if (tag.locals.index + 1) % tag.locals.columns == 0
    else
      raise TagError.new("You need to define the columns attribute")
    end
  end

  desc %{
    Renders the contained elements only if the current contextual page
    is an even-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_even [status="published"]>...</r:if_even></code></pre>
  }
  tag "modulo:if_even" do |tag|
    tag.expand if (tag.locals.index + 1) % 2 == 0
  end
  
 
  desc %{
    Renders the contained elements unless the current contextual page
    is an even-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_even [status="published"]>...</r:if_even></code></pre>
  }
  tag "modulo:unless_even" do |tag|
    tag.expand unless (tag.locals.index + 1) % 2 == 0
  end
  
  desc %{
    Renders the contained elements only if the current contextual page
    is an odd-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_odd [status="published"]>...</r:if_odd></code></pre>
  }
  tag "modulo:if_odd" do |tag|
    tag.expand if (tag.locals.index + 1) % 2 != 0
  end
  
  desc %{
    Renders the contained elements unless the current contextual page
    is an odd-numbered child. The @status@ attribute limits the status
    of found child pages to the given status, the default is
    @"published"@. @status="all"@ includes all non-virtual pages
    regardless of status.

    *Usage:*
    
    <pre><code><r:if_even [status="published"]>...</r:if_even></code></pre>
  }
  tag "modulo:unless_odd" do |tag|
    tag.expand unless (tag.locals.index + 1) % 2 != 0
  end

  private


end
