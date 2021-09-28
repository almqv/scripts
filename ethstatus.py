#!/usr/bin/python
import requests as req

API_URL = "https://api.ethermine.org"
MINER = "0x911E5f336c0371bBdD80773D2910E352545461F8"

def get_current_stats(api_url: str, miner: str):
    res = req.get(f"{api_url}/miner/{miner}/currentStats")
    return res.json(), res.text

if __name__ == "__main__":
    # print dashboard
    stats, jsontext = get_current_stats(API_URL, MINER)

    worker_status = stats["status"]
    usdpermin = float(stats["data"]["usdPerMin"])
    hashrate = float(stats["data"]["currentHashrate"])
    unpaid = round(float(stats["data"]["unpaid"]) / 10**18, 16)

    print(f"Worker Status: {worker_status}")
    print(f"Hashrate: ~{round(hashrate/10**6, 2)} MH/s")
    print(f"Unpaid: ~{unpaid} ETH")

    print("")

    print(f"USD/min: {usdpermin}")
    print(f"USD/hour: {usdpermin*60}")
    print(f"USD/day: {usdpermin*60*24}")
    print(f"USD/30days: {usdpermin*60*24*30}")
