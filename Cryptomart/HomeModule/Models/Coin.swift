//
//  Coin.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import Foundation

/*
 
 List of Coin URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h

 RESPONSE:
 [
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 16118.95,
     "market_cap": 309570097222,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 338337007991,
     "total_volume": 26861059852,
     "high_24h": 16269.92,
     "low_24h": 15649.4,
     "price_change_24h": 298.19,
     "price_change_percentage_24h": 1.88482,
     "market_cap_change_24h": 5454238829,
     "market_cap_change_percentage_24h": 1.79347,
     "circulating_supply": 19214487,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -76.67086,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 23654.2975,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-11-22T21:31:59.829Z",
     "sparkline_in_7d": {
       "price": [
         17012.123731873995,
         16707.257677987018,
         16820.58496349045,
         16820.062114949425,
       ]
     },
     "price_change_percentage_24h_in_currency": 1.8848219732103215
   }
 ]
 
 [{\"id\":\"bitcoin\",\"symbol\":\"btc\",\"name\":\"Bitcoin\",\"image\":\"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579\",\"current_price\":17242.9,\"market_cap\":331875548111,\"market_cap_rank\":1,\"fully_diluted_valuation\":362456654680,\"total_volume\":21781668860,\"high_24h\":17291.85,\"low_24h\":16799.07,\"price_change_24h\":420.46,\"price_change_percentage_24h\":2.49938,\"market_cap_change_24h\":8698912909,\"market_cap_change_percentage_24h\":2.69169,\"circulating_supply\":19228193.0,\"total_supply\":21000000.0,\"max_supply\":21000000.0,\"ath\":69045,\"ath_change_percentage\":-75.02424,\"ath_date\":\"2021-11-10T14:24:11.849Z\",\"atl\":67.81,\"atl_change_percentage\":25330.92285,\"atl_date\":\"2013-07-06T00:00:00.000Z\",\"roi\":null,\"last_updated\":\"2022-12-08T19:58:46.406Z\",\"sparkline_in_7d\":{\"price\":[17043.06431292914,16935.463430135744,17020.131204518195,16954.05700045591,16995.53315716639,17034.498305438967,16972.73406077455,17081.150167124026,16948.36671386534,16942.054880659063,16902.817480380327,16942.49231707887,16946.570093400518,16947.7892238246,16970.40580620059,16981.45239770451,16993.80115471984,17022.025662866505,17017.112935036814,17033.747473205276,16897.500491380804,16950.59420135294,16994.937937916297,16996.800931238537,17002.948632295716,16975.170745089505,16985.62404418803,17019.17057523081,17033.57112936429,17072.74210514936,17146.572922646876,17058.69860095004,17095.759040549874,17038.357138627503,17029.67328522309,17039.273450054534,17028.204598357406,16980.95078308812,16975.966277828276,16945.17570213079,16975.82529136985,16969.500587760685,16958.000567893032,16976.055904526827,16954.45059417445,16988.04760690205,16977.260935771137,16960.51931608474,16986.85561769628,16986.626054983277,16975.783530886532,16947.974134602155,17009.901940548327,16889.141270527234,16923.38287008033,16964.2705313402,16983.609233119583,16990.554104903982,17023.60922016028,17007.289553678147,17022.758055999875,17008.136638743,17008.52586263672,17021.14533305147,17014.17595115737,17019.596431812082,16961.13024931239,16966.97512562053,16951.65896780764,17018.60483856467,17033.664119069625,17026.696220790647,17051.529535893213,17067.936248873008,17108.53008106652,17113.724296211523,17121.49073038419,17115.71613894933,17133.314036600437,17248.204572652827,17263.418399857383,17279.638868059166,17213.109687042415,17359.93226426968,17335.209928550514,17313.188379228948,17353.65095550951,17362.294935265112,17323.41084187813,17322.553316728303,17307.38893204122,17261.150912572957,17269.310501635624,17219.590861680957,17095.134772010668,17056.581550243616,17076.030889043755,17070.092228158217,16940.094705487634,16944.721650654144,16975.611271720674,16956.882519988492,16973.11921772874,17053.793721625203,17052.305032434102,17045.69714418894,17010.581571419967,17021.636651699464,16986.6840352439,17007.438511238695,17009.58416833736,17017.856224434054,16985.311560442296,16978.75133721155,16991.72643812415,17009.61517379896,16996.327449300534,16996.769488951515,17003.907489173973,16999.13939889904,16962.526726316668,16979.78181141871,16972.653044905135,16978.45341056707,16989.633943030687,16983.862389793616,17085.64314125141,17088.005860286976,17041.19942892948,17052.194857001756,17033.768885369343,17046.552710151736,17015.200437508767,16946.489552142873,16781.776625015926,16812.385788258976,16842.44297766084,16834.64590183583,16793.68232029834,16804.322361529805,16863.249319253497,16847.125773744527,16832.0530190796,16810.812185708884,16807.971977810765,16807.60900216228,16822.441072246693,16833.471269030986,16821.247785256044,16851.10352096307,16849.191359681357,16861.693095364677,16847.572378794717,16840.709881567185,16840.886170547008,16817.744602893225,16827.080987796886,16809.553779945796,16828.724286137396,16842.11199983814,16818.73130365678,16821.238951435957,16871.344104447435,16838.614894080685,16851.31483645213,16883.431841049773,16932.820495317523,16932.736987429813]},\"price_change_percentage_24h_in_currency\":2.499377081735124}
 ]
 
 */

struct Coin: Decodable, Identifiable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let myHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case myHoldings
    }
    
    func updateMyHoldings(with amount: Double) -> Coin {
        return Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, myHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (myHoldings ?? 0.0) * currentPrice
    }
}

struct SparklineIn7D: Decodable {
    let price: [Double]?
    
    var chartItems: [ChartItem] {
        var item: [ChartItem] = []
        price?.enumerated().forEach({ (index, value) in
            item.append(ChartItem(price: value, index: index))
        })
        return item
    }
    var minValue: Double {
        return price?.min() ?? 0.0
    }
    var maxValue: Double {
        return price?.max() ?? 0.0
    }
}

struct ChartItem: Hashable, Identifiable {
    var id = UUID()
    
    let price: Double
    let index: Int
    var animate: Bool = false
}
