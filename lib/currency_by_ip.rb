require "currency_by_ip/version"
require "currency_by_ip/country_to_currency"

require "geoip"

module CurrencyByIp
  def self.find_by_ip(ip,
      geoip_data_path: "lib/currency_by_ip/GeoIP.dat",
      geoip: nil)
    geoip ||= GeoIP.new(geoip_data_path)
    country = geoip.country(ip)
    find_by_country_code(country.country_code2)
  end

  def self.find_by_country_code(country_code)
    COUNTRY_TO_CURRENCY[country_code]
  end
end
