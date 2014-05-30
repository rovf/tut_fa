require 'spec_helper'

# HTTP Status Codes:
# http://www.w3.org/Protocols/HTTP/HTRESP.html

describe "StaticPages" do
  describe "GET /static_pages" do
    it "should have the content 'こんにちは'" do
       visit '/static_pages/home'
       expect(page).to_have_content('こんにちは')
    end
  end
end
