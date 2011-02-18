require File.dirname(__FILE__) + '/../spec_helper'

describe 'Modulo' do
  dataset :pages
  
  describe "<r:modulo:if_even>" do
    it "should print the tag's contents if we're in an even child" do
      markup = '<r:children:each by="title"><r:modulo:if_even><r:title /></r:modulo:if_even></r:children:each>'
      
      expected = "Child 2"

      pages(:parent).should render(markup).as(expected)
    end
  end
  
  describe "<r:modulo:unless_even>" do
    it "should not print the tag's contents if we're in an even child" do
      markup = '<r:children:each by="title"><r:modulo:unless_even><r:title /></r:modulo:unless_even></r:children:each>'
    
      expected = "ChildChild 3"
      
      pages(:parent).should render(markup).as(expected)
    end
  end
  
  describe "<r:modulo:if_odd>" do
    it "should print the tag's contents if we're in an odd child" do
      markup = '<r:children:each by="title"><r:modulo:if_odd><r:title /></r:modulo:if_odd></r:children:each>'
      
      expected = "ChildChild 3"
      
      pages(:parent).should render(markup).as(expected)
    end
  end

  describe "<r:modulo:unless_odd>" do
    it "should not print the tag's contents if we're in an odd child" do
      markup = '<r:children:each by="title"><r:modulo:unless_odd><r:title /></r:modulo:unless_odd></r:children:each>'
      
      expected = "Child 2"
      
      pages(:parent).should render(markup).as(expected)
    end
  end

  describe "<r:modulo:index>" do
    it "should return the index of the item" do
      markup = '<r:children:each by="title"><r:modulo:index /><r:title />-</r:children:each>'
    
      expected = "0Child-1Child 2-2Child 3-"
    
      pages(:parent).should render(markup).as(expected)
    
    end
  end

  describe "<r:modulo:if_last_column>" do
    it "should return the index of the item" do
      markup = '<r:children:each by="title"><r:modulo columns="3"><r:if_last_column>last</r:if_last_column><r:title /></r:modulo></r:children:each>'
    
      expected = "ChildChild 2lastChild 3"
    
      pages(:parent).should render(markup).as(expected)
    
    end
  end

end
