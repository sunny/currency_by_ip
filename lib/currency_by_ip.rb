require "currency_by_ip/version"
require "currency_by_ip/country_to_currency"

require "geoip"

module CurrencyByIp
  def self.find_by_ip(ip, geoip_data_path: "lib/currency_by_ip/GeoIP.dat")
    geo_ip = GeoIP.new(geoip_data_path)
    country = geo_ip.country(ip)
    COUNTRY_TO_CURRENCY[country.country_code2]
  end
end
