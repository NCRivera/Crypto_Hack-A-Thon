library(tidyverse)
library(jsonlite)
library(lubridate)


# crypto_tickers <- read.csv(file = "data/crypto-currency.csv")
crypto_tickers <- c("BTC", "ETH", "USDT", "BNB", "ADA", "DOT", "XRP", "UNI", "LTC", "THETA", "LINK", "USDC", "BCH", "XLM", "KLAY", "FIL", "WBTC", "LUNA", "DOGE", "VET", "CRO", "TRX", "AAVE", "SOL", "KSM", "ATOM", "XMR", "MIOTA", "BTT", "EOS", "BSV", "AVAX", "BUSD", "FTT", "XTZ", "XEM", "ALGO", "DAI", "NEO", "CHZ", "HBAR", "EGLD", "HT", "CAKE", "LEO", "TFUEL", "SUSHI", "DCR", "MKR", "DASH", "SNX", "NPXS", "ENJ", "GRT", "BTMX", "ZIL", "NEAR", "HOT", "MATIC", "COMP", "RVN", "ONE", "BAT", "BTCB", "UST", "ZEC", "NEXO", "RUNE", "MANA", "ETC", "STX", "UMA", "ICX", "BNT", "WAVES", "CHSB", "CEL", "YFI", "ANKR", "VGX", "ONT", "REV", "ZRX", "RSR", "SC", "DENT", "DGB", "REN", "FTM", "FLOW", "AR", "PAX", "QTUM", "IOST", "OKB", "OMG", "HNT", "HUSD", "CRV", "RENBTC", "CELO", "VTHO", "CKB", "BTG", "LRC", "NANO", "OCEAN", "1INCH", "MVL", "LSK", "GLM", "STORJ", "LPT", "ZEN", "FET", "KNC", "HEDG", "XVG", "QNT", "ZKS", "STMX", "ALPHA", "EWT", "ORBS", "CELR", "SNT", "REEF", "SKL", "KCS", "ANT", "XVS", "BAL", "DODO", "IOTX", "WAXP", "REP", "FUN", "POLY", "KIN", "TEL", "TUSD", "SWAP", "BADGER", "KAVA", "COTI", "CVC", "BORA", "MAID", "ARDR", "META", "VLX", "QKC", "STEEM", "SXP", "BAND", "TRAC", "OXT", "KMD", "OGN", "AGI", "IQ", "UTK", "MED", "ARK", "ROSE", "RIF", "MFT", "POLS", "SRM", "ALICE", "NU", "CVT", "NMR", "AVA", "XHV", "GNO", "BTS", "SPND", "IRIS", "WAN", "AMPL", "ELF", "HIVE", "JST", "BCD", "WOO", "TOMO", "NOIA", "STRAX", "LTO", "RDD", "SYS", "CRE", "SHR", "UOS", "SCRT", "ZB", "POWR", "XOR", "LIT")



API_BUY <- function(Ticker){
    x <- str_glue(
        # "https://bigdataforall.com/stocks/?",
        "https://bigdataforall.com/crypto/?",
        # "key=pogba&tiingo_key=bb4ce17dee09aa67599085bde6f6c0e420aa5d5f",
        "key=9a77c771-8e8c-11eb-adad-da11bc1fe3d8",
        "&request=buy&symbol={Ticker}&quantity=.025",
        sep = ""
    )
    return(x)
}


API_SELL <- function(Ticker){
    x <- SellURL <- str_glue(
        "https://bigdataforall.com/stocks/?",
        "key=pogba&tiingo_key=bb4ce17dee09aa67599085bde6f6c0e420aa5d5f",
        "&request=sell&symbol={Ticker}&quantity=3",
        sep = ""
    )
    return(x)
}


Dataset <- Dataset %>% 
    mutate(API_BUY = Ticker %>% map_chr(API_BUY), 
           API_SELL = Ticker %>% map_chr(API_SELL))

loop_vector <- Dataset %>% pull(API_BUY) %>% c()

# buy_data <- fromJSON(BuyURL, flatten = TRUE)

# sell_url <- fromJSON(SellURL, flatten = TRUE)

#BUY
for (tckr in loop_vector) {
    x <- fromJSON(tckr)
    print(tckr)
    print(x)
    Sys.sleep(30)
}



