module API
  class Base < Grape::API
    # urlの第１セグメント名 ex) http://localhost/api/
    format :json
    prefix 'api'
    mount API::Ver1::Base
  end
end