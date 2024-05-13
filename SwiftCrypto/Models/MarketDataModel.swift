//
//  MarketDataModel.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/13/24.
//

import Foundation

//Fake API
//https://mocki.io/v1/e8ac98b3-9b9e-42c4-b99f-ff4b4dfc29e6

/*
Json Data
{
    "data": {
        "active_cryptocurrencies": 14215,
        "upcoming_icos": 0,
        "ongoing_icos": 49,
        "ended_icos": 3376,
        "markets": 1089,
        "total_market_cap": {
            "btc": 38473585.50199389,
            "eth": 818112937.851689,
            "ltc": 29725319768.461033,
            "bch": 5462692089.183285,
            "bnb": 4070856609.0145636,
            "eos": 3109245385214.4736,
            "xrp": 4768696322103.69,
            "xlm": 23124416686393.945,
            "link": 178959547198.31342,
            "dot": 359188033107.2193,
            "yfi": 361100216.6931451,
            "usd": 2422758594527.6587,
            "aed": 8898550041840.623,
            "ars": 2.142314353900845e+15,
            "aud": 3667346643846.6753,
            "bdt": 283345784774791.94,
            "bhd": 912953584624.2902,
            "bmd": 2422758594527.6587,
            "brl": 12496831106433.107,
            "cad": 3314883723514.7944,
            "chf": 2199058025219.1367,
            "clp": 2.237054148257113e+15,
            "cny": 17523086086640.195,
            "czk": 55625325951057.87,
            "dkk": 16750565281189.09,
            "eur": 2245303641271.478,
            "gbp": 1930073675020.2947,
            "gel": 6486931291330.629,
            "hkd": 18927760332851.2,
            "huf": 868200387866174.2,
            "idr": 3.904243923738415e+16,
            "ils": 9016283995741.709,
            "inr": 202335504138541.7,
            "jpy": 378450640396084.3,
            "krw": 3314238135877624.5,
            "kwd": 745167860918.8718,
            "lkr": 725124633455996.1,
            "mmk": 5.086299299119381e+15,
            "mxn": 40722574422328.91,
            "myr": 11464493669304.877,
            "ngn": 3501588769084877.5,
            "nok": 26228542268496.953,
            "nzd": 4027659302024.8257,
            "php": 140063323024087.08,
            "pkr": 673940599536288.9,
            "pln": 9621612653343.041,
            "rub": 221864341187661.1,
            "sar": 9086577913603.328,
            "sek": 26274317869381.977,
            "sgd": 3279567171482.3623,
            "thb": 89191434898941.22,
            "try": 78035598251820.55,
            "twd": 78536140177449.86,
            "uah": 95959856820335.52,
            "vef": 242590818070.0543,
            "vnd": 6.166768588580961e+16,
            "zar": 44453765600658.77,
            "xdr": 1833817476059.7131,
            "xag": 86080855139.4272,
            "xau": 1037110271.5594554,
            "bits": 38473585501993.89,
            "sats": 3847358550199388.5
        },
        "total_volume": {
            "btc": 1193095.6562333389,
            "eth": 25370315.23637328,
            "ltc": 921805166.6658382,
            "bch": 169402308.56848606,
            "bnb": 126240413.36392592,
            "eos": 96420105245.21277,
            "xrp": 147880962836.25433,
            "xlm": 717106054491.2438,
            "link": 5549674032.661383,
            "dot": 11138698836.608582,
            "yfi": 11197997.129203914,
            "usd": 75131618681.16333,
            "aed": 275950922254.0444,
            "ars": 66434825779182.09,
            "aud": 113727257119.00761,
            "bdt": 8786772031146.173,
            "bhd": 28311397077.910683,
            "bmd": 75131618681.16333,
            "brl": 387536402319.3083,
            "cad": 102797109233.27206,
            "chf": 68194490933.47549,
            "clp": 69372780109252.14,
            "cny": 543404458435.25,
            "czk": 1724984399110.1724,
            "dkk": 519447990502.5737,
            "eur": 69628603270.86147,
            "gbp": 59853078101.017914,
            "gel": 201164758755.57782,
            "hkd": 586964493709.0701,
            "huf": 26923565817632.203,
            "idr": 1.210736250731376e+15,
            "ils": 279601943263.85596,
            "inr": 6274580545059.052,
            "jpy": 11736047193519.129,
            "krw": 102777089061105.22,
            "kwd": 23108231957.765404,
            "lkr": 22486675965236.074,
            "mmk": 157730076906076.6,
            "mxn": 1262838542859.5298,
            "myr": 355522819599.2648,
            "ngn": 108586977163698.48,
            "nok": 813367390680.4053,
            "nzd": 124900831449.27011,
            "php": 4343472024175.779,
            "pkr": 20899419468569.348,
            "pln": 298373653322.9633,
            "rub": 6880184892836.452,
            "sar": 281781812048.271,
            "sek": 814786927483.7678,
            "sgd": 101701915627.75665,
            "thb": 2765895410128.347,
            "try": 2419944283617.443,
            "twd": 2435466476036.9683,
            "uah": 2975789411132.0103,
            "vef": 7522928978.54488,
            "vnd": 1912362656100986.2,
            "zar": 1378545668394.0295,
            "xdr": 56868098890.81536,
            "xag": 2669433924.903602,
            "xau": 32161592.008845605,
            "bits": 1193095656233.3389,
            "sats": 119309565623333.89
        },
        "market_cap_percentage": {
            "btc": 51.19829031525841,
            "eth": 14.670792248874855,
            "usdt": 4.577808945933272,
            "bnb": 3.7812129682384468,
            "sol": 2.711127940607664,
            "usdc": 1.3652023409051404,
            "xrp": 1.1622232625788886,
            "steth": 1.1431235327489024,
            "ton": 1.0424779441609082,
            "doge": 0.9013044430116542
        },
        "market_cap_change_percentage_24h_usd": 1.9393583875464835,
        "updated_at": 1715614232
    }
}
 */

// MARK: - GlobalData
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - MarketDataModel
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
//        if let item = totalMarketCap.first(where: { (key, value) -> Bool in
//            return key == "usd"
//        }) {
//            return "\(item.value)"
//        }
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPrecentString()
        }
        return ""
        
    }
}
