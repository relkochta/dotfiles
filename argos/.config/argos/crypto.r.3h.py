#!/usr/bin/env python3

import json
import os, sys
from coinmarketcapapi import CoinMarketCapAPI, CoinMarketCapAPIError

def crypto(currencies, key):
        cmc = CoinMarketCapAPI(key)
        listings = cmc.cryptocurrency_listings_latest().data
        filtered_listings = list(filter(lambda coin: (coin["symbol"] in currencies), listings))
        ret = ""
        for coin in filtered_listings:
                price = format(int(coin["quote"]["USD"]["price"]), ',d')
                ret += "%s: $%s   " % (coin["symbol"], price)
        return ret[:-3]

def main():
        try:
                with open(os.path.expanduser("~/.secrets/secrets.json")) as f:
                        secrets = json.load(f)
                        key = secrets["coinmarketcap_apikey"]
        except Exception:
                print("Failed to load secrets.json")
                return 1
        print(crypto(["BTC", "ETH"], key))

if __name__ == "__main__":
        ret = main()
        if ret:
                sys.exit(ret)
