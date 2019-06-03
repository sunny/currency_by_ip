require "spec_helper"

describe CurrencyByIp do
  it "has a version number" do
    expect(CurrencyByIp::VERSION).to match(/^\d+\.\d+\.\d+/)
  end

  context "find_by_ip" do
    it "detects USD for Google's IP" do
      expect(CurrencyByIp.find_by_ip("173.194.34.1")).to eq("USD")
    end

    it "detects EUR for Le Monde's IP" do
      expect(CurrencyByIp.find_by_ip("195.154.120.129")).to eq("EUR")
    end

    it "detects GBP for BBC's IP" do
      expect(CurrencyByIp.find_by_ip("212.58.244.18")).to eq("GBP")
    end

    it 'detects EUR for IP in the "EU" country code' do
      expect(CurrencyByIp.find_by_ip("141.101.80.42")).to eq("EUR")
    end

    it "returns nil if it cannot find it" do
      expect(CurrencyByIp.find_by_ip("0.1.1.1")).to eq(nil)
    end

    it "accepts a geo_ip_path arg" do
      path = "lib/../lib/currency_by_ip/GeoIP.dat"
      result = CurrencyByIp.find_by_ip("1.2.3.4", geoip_data_path: path)
      expect(result).to eq("USD")
    end

    it "raises an error if the geo_ip_path is wrong" do
      expect do
        CurrencyByIp.find_by_ip("1.2.3.4", geoip_data_path: "foo")
      end.to raise_error(/No such file or directory/)
    end

    it "accepts a geoip arg" do
      country = double :country, country_code2: "US"
      geoip = double :geoip, country: country

      result = CurrencyByIp.find_by_ip("1.2.3.4", geoip: geoip)
      expect(result).to eq("USD")
    end
  end

  context "find_by_country_code" do
    it "detects USD for USA" do
      expect(CurrencyByIp.find_by_country_code("US")).to eq("USD")
    end

    it "detects EUR for France" do
      expect(CurrencyByIp.find_by_country_code("FR")).to eq("EUR")
    end

    it "returns nil if it cannot find it" do
      expect(CurrencyByIp.find_by_country_code("")).to eq(nil)
      expect(CurrencyByIp.find_by_country_code(nil)).to eq(nil)
    end
  end
end
