class JsonWebToken
  SECRET_KEY = ENV['JWT_SECRET']

  def self.encode payload
    JWT.encode payload, SECRET_KEY
  end

  def self.decode token
    decoded_value = JWT.decode(token, SECRET_KEY)
    HashWithIndifferentAccess.new(decoded)

    # Note that this HashWithIndifferentAccess is used to help u use hash['key'] and 
    # also hash[:key]. That is, basically it shows no racism if u use a string
    # or a symbol. It is indifferent as the name goes.
  rescue
    nil
  end

end
